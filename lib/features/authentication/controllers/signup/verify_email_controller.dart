import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:m_store/common/widgets/success_screen/success_screen.dart';
import 'package:m_store/data/repositories/data.repositories/authentication_repository.dart';
import 'package:m_store/navigation_menu.dart';
import 'package:m_store/utils/constants/image_strings.dart';
import 'package:m_store/utils/constants/text_strings.dart';
import 'package:m_store/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController  {
  static VerifyEmailController get instance =>Get.find();

//<<<<<<<<< ----Send email whenever verify screen appears & Set Timer for auto redirect --->>>>>>>>>//
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }


//<<<<<<<<---Send Email Verification link--->>>>>>>>//
  sendEmailVerification () async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      MLoaders.successSnackBar(title: 'Email Sent' , message: 'Please Check your inbox and verify your email');
    } catch(e) {
      MLoaders.errorSnackBar(title: 'Oh Snap' , message: e.toString());
    }
  }


//<<<<<<<<<---Timer to automatically redirect on email verification--->>>>>>>>>//
  setTimerForAutoRedirect () {
     Timer.periodic(const Duration(seconds: 1), (timer)async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false ){
        timer.cancel();
        Get.off(()=>SuccessScreen(
          image: MImages.staticSuccessIllustration,
          title: MTexts.yourAccountCreatedTitle,
          subtitle: MTexts.yourAccountCreatedSubTitle,
            onPressed: () => Get.offAll(()=> NavigationMenu())
        ) );
      }
     });
  }


//<<<<<<---manually check if email verified>>>>>>>----//
  checkEmailVerificationStatus () async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(()=>SuccessScreen(
        image: MImages.staticSuccessIllustration,
        title: MTexts.yourAccountCreatedTitle,
        subtitle: MTexts.yourAccountCreatedSubTitle,
        onPressed: () => AuthenticationRepository.instance.screenRedirect,
      ) );
    }
  }
}