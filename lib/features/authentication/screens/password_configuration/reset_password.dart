import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/features/authentication/screens/login/login.dart';
import 'package:m_store/utils/constants/image_strings.dart';
import 'package:m_store/utils/constants/sizes.dart';
import 'package:m_store/utils/constants/text_strings.dart';
import '../../../../utils/helper/helper_function.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});


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
              Text(MTexts.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: MSize.spaceBtwSections,),
              Text(MTexts.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: MSize.spaceBtwSections,),


              SizedBox(width: double.infinity,child: ElevatedButton( onPressed: (){} ,child: const Text(MTexts.mContinue),),),

              const SizedBox(height: MSize.spaceBtwItems,),

              SizedBox(width: double.infinity,child: TextButton( onPressed: (){} ,child: const Text(MTexts.resendEmail),),),


            ],
          ),
        ),
      ),
    );
  }
}
