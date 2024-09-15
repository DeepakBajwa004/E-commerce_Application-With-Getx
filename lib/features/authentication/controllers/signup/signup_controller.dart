import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:m_store/data/repositories/data.repositories/authentication_repository.dart';
import 'package:m_store/data/repositories/user/user_repositories.dart';
import 'package:m_store/features/authentication/models/user_model.dart';
import 'package:m_store/features/authentication/screens/signup/verifiy_email.dart';
import 'package:m_store/utils/helper/network_manager.dart';
import 'package:m_store/utils/popups/full_screen_loader.dart';

import '../../../../utils/popups/loaders.dart';


class SignupController extends GetxController {
  static SignupController get instance => Get.find();

// ======----<<<<Variable---->>>>======= //

  final privacyPolicy = true.obs;                //Observable for Privacy Policy
  final hidePassword = true.obs;                 //Observable for hiding/showing Password
  final firstName = TextEditingController();      // Controller For First Name Input
  final lastName = TextEditingController();      // Controller For First Last Input
  final userName = TextEditingController();      // Controller For First UserName Input
  final email = TextEditingController();         // Controller For First Email Input
  final phoneNumber = TextEditingController();   // Controller For First PhoneNumber Input
  final password = TextEditingController();      // Controller For First Password Input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); //Form Key For Form Validation



// ======----<<<<Sign-Up---->>>>======= //

signup () async {
  try {

        final isConnected = await NetworkManager.instance.isConnected();
        if(!isConnected) {
          MFullScreenLoader.stopLoading();
        return;
      }

        if((signupFormKey.currentState!.validate())==false){
          MFullScreenLoader.stopLoading();
          return;
        }

        if(privacyPolicy.value==false) {
          MLoaders.warningSnackBar(title: 'Accept Privacy Policy', message: 'Please read our term & condition');
          return;
        }

        final userCredential = await AuthenticationRepository.
        instance.registerWithEmailAndPassword(email.text, password.text);

        final newUser = UserModel(
            id: userCredential.user!.uid,
            firstName: firstName.text.trim(),
            lastName: lastName.text.trim(),
            userName: userName.text.trim(),
            email: email.text.trim(),
            phoneNumber: phoneNumber.text.trim(),
            profilePicture: '',
        );

        final userRepositories = Get.put(UserRepository());
        await userRepositories.saveUserRecord(newUser);


        MFullScreenLoader.stopLoading();

         MLoaders.successSnackBar(title: 'Congratulations',message: 'Your account has been created');

        Get.to(()=>  VerifyEmailScreen(email: email.text.trim(),));


  } catch(e){
    MFullScreenLoader.stopLoading();
    MLoaders.errorSnackBar(title: 'Oh Snap' , message: e.toString());
  }
 }
}