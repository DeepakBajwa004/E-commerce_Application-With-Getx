import 'package:flutter/material.dart';
import 'package:m_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:m_store/features/authentication/screens/login/widgets/login_header.dart';
import '../../../../common/styles/spacing_style.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_button.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: MSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [

              //Header
              LoginHeader(),

              // Form
              LoginForm(),

              //Divider
              FormDivider(dividerText: MTexts.orSignInWith,),

              SizedBox(height: MSize.spaceBtwItems,),

              //Footer
              SocialButton()

            ],
          ),
        ),
      ),
    );
  }
}







