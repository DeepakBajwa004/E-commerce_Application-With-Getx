import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:m_store/utils/constants/sizes.dart';
import 'package:m_store/utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(MTexts.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: MSize.spaceBtwItems,),
              Text(MTexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,),
              const SizedBox(height: MSize.spaceBtwSections * 2,),

              TextFormField(
                decoration:  InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    labelText: MTexts.email, prefixIcon: const Icon(Iconsax.direct_right)),
              ),

              const SizedBox(height: MSize.spaceBtwSections),

              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=> Get.to(()=>const ResetPassword()), child: const Text(MTexts.submit)))
            ],
          ),
        ),
      ),
    );
  }
}
