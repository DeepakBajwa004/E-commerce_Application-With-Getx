import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/features/authentication/controllers/login/login_controller.dart';
import 'package:m_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:m_store/utils/validators/validation.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helper/helper_function.dart';
import '../../signup/signup.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    final controller = Get.put(LoginController()); // Use Get.find instead of Get.put

    return Form(
      key: controller.signInFormKey, // Add FormKey to Form
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MSize.spaceBtwSections),
        child: Column(
          children: [
            /*<<<<<----E-mail---->>>>>*/
            TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => MValidator.validateEmail(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_right),
                floatingLabelStyle: TextStyle(color: dark ? MColors.white : MColors.black),
                labelText: MTexts.email,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: MSize.spaceBtwInputFields),

            /*<<<<<----Password---->>>>>*/
            Obx(
                  () => TextFormField(
                controller: controller.password,
                validator: (value) => MValidator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: MTexts.password,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: controller.hidePassword.value
                        ? const Icon(Iconsax.eye_slash)
                        : const Icon(Icons.remove_red_eye_outlined),
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  ),
                ),
              ),
            ),
            const SizedBox(height: MSize.spaceBtwInputFields / 2),

            /*<<<<<----Remember me & Forgot Password---->>>>>*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //----Remember ME----/
                Row(
                  children: [
                    Obx(
                          () => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) => controller.rememberMe.value = value ?? false,
                          ),
                    ),
                    const Text(MTexts.rememberME),
                  ],
                ),
                //----ForgotPassword----/
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(MTexts.forgotPassword),
                ),
              ],
            ),
            const SizedBox(height: MSize.spaceBtwSections),

            //----Sign-IN----/
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.signIn();
                },
                child: const Text(MTexts.signIn),
              ),
            ),
            const SizedBox(height: MSize.spaceBtwItems),

            //----Create Account----/
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(
                      () => const SignupScreen(),
                  transition: Transition.zoom,
                  duration: const Duration(seconds: 1),
                ),
                child: const Text(MTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
