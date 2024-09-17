import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:m_store/features/authentication/screens/login/login.dart';
import 'package:m_store/utils/constants/image_strings.dart';
import 'package:m_store/utils/constants/sizes.dart';
import 'package:m_store/utils/constants/text_strings.dart';
import '../../../../utils/helper/helper_function.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: Theme.of(context).iconTheme,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.off(()=>const LoginScreen()), icon: const Icon(CupertinoIcons.clear,))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSize.defaultSpace),
          child: Column(
            children: [

              Image(image:  const AssetImage(MImages.deliveredEmailIllustration),width: MHelperFunction.screenWidth()*0.6,),

              const SizedBox(height: MSize.spaceBtwSections,),


              // Title & SubTitle
              Text(email, style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
              Text(MTexts.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: MSize.spaceBtwSections,),
              Text(MTexts.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: MSize.spaceBtwSections,),

              SizedBox(width: double.infinity,child: ElevatedButton( onPressed: (){
                 Get.off(()=> LoginScreen());
              } ,child: const Text(MTexts.mContinue),),),

              const SizedBox(height: MSize.spaceBtwItems,),

              SizedBox(
                width: double.infinity,child: TextButton(
                onPressed: ()=>ForgetPasswordController.instance.resendPasswordResetEmail(email),
                child: const Text(MTexts.resendEmail),),),
            ],
          ),
        ),
      ),
    );
  }
}
