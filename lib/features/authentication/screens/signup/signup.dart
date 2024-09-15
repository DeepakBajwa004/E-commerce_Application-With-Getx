import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:m_store/utils/constants/sizes.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_button.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: Theme.of(context).iconTheme,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSize.defaultSpace),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //Header
              Text(MTexts.signUpTitle, style: Theme.of(context).textTheme.headlineMedium,),

              const SizedBox(height: MSize.spaceBtwSections,),

              //Sign Up Form
              const SIgnUpForm(),

              const SizedBox(height: MSize.spaceBtwSections,),

              FormDivider(dividerText: MTexts.orSignUpWith.capitalize!,),

              const SizedBox(height: MSize.spaceBtwSections,),

              const SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}


