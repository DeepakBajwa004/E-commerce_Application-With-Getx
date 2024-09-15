import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:m_store/utils/constants/sizes.dart';
import 'package:m_store/utils/constants/text_strings.dart';

import '../../../../data/repositories/data.repositories/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helper/helper_function.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar( actionsIconTheme: Theme.of(context).iconTheme, automaticallyImplyLeading: false,
      actions: [ IconButton(onPressed: () => Get.offAll(() => AuthenticationRepository.instance.logoutUser()), icon: const Icon(CupertinoIcons.clear))],),
      body: SingleChildScrollView(
        child: Padding( padding: const EdgeInsets.all(MSize.defaultSpace),
          child: Column(
            children: [

              //Image
              Image(image: const AssetImage(MImages.deliveredEmailIllustration), width: MHelperFunction.screenWidth() * 0.6,),

              const SizedBox(height: MSize.spaceBtwSections,),

              // Title & SubTitle
              Text(MTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),

              const SizedBox(height: MSize.spaceBtwSections,),

              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),

              const SizedBox(height: MSize.spaceBtwSections,),

              Text(MTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),

              const SizedBox(height: MSize.spaceBtwSections,),

              //Confirm Email Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(MTexts.confirmEmail),
                ),
              ),

              const SizedBox(height: MSize.spaceBtwItems,),

              //Resend Email Button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: ()=> controller.sendEmailVerification(),
                  child: const Text(MTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
