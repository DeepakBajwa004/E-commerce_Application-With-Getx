import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/features/authentication/screens/signup/widgets/terms_and_condition.dart';
import 'package:m_store/utils/constants/colors.dart';
import 'package:m_store/utils/helper/helper_function.dart';
import 'package:m_store/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/signup/signup_controller.dart';

class SIgnUpForm extends StatelessWidget {
  const SIgnUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
      children: [

        // First & Last Name
        Row(
          children: [
            // FirstName
            Expanded(
              child: TextFormField(
                controller: controller.firstName,
                validator:  (value) => MValidator.validateEmptyText('First name', value),
                expands: false,
                decoration:  InputDecoration(floatingLabelStyle: TextStyle(color: MHelperFunction.isDarkMode(context) ? MColors.white : MColors.black),
                labelStyle: Theme.of(context).textTheme.bodyMedium, labelText: MTexts.firstName, prefixIcon: const Icon(Iconsax.user)),
              ),
            ),

            const SizedBox(width: MSize.spaceBtwInputFields,),

            // LastName
            Expanded(
              child: TextFormField(
                controller: controller.lastName,
                validator: (value) => MValidator.validateEmptyText('Last name', value),
                expands: false,
                decoration:  InputDecoration(floatingLabelStyle: TextStyle(color: MHelperFunction.isDarkMode(context) ? MColors.white : MColors.black),
                labelStyle: Theme.of(context).textTheme.bodyMedium, labelText: MTexts.lastName, prefixIcon: const Icon(Iconsax.user)),
              ),
            ),
          ],
        ),

        const SizedBox(height: MSize.spaceBtwInputFields,),

        // UserName
        TextFormField(
          controller: controller.userName,
          validator: (value) => MValidator.validateEmptyText('User name', value),
          expands: false,
          decoration:  InputDecoration(floatingLabelStyle: TextStyle(color: MHelperFunction.isDarkMode(context) ? MColors.white : MColors.black),
          labelStyle: Theme.of(context).textTheme.bodyMedium, labelText: MTexts.userName, prefixIcon: const Icon(Iconsax.user_edit)),
        ),

        const SizedBox(height: MSize.spaceBtwInputFields,),

        // Email
        TextFormField(
          controller: controller.email,
          validator: (value) => MValidator.validateEmail(value),
          decoration:  InputDecoration(floatingLabelStyle: TextStyle(color: MHelperFunction.isDarkMode(context) ? MColors.white : MColors.black),
          labelStyle: Theme.of(context).textTheme.bodyMedium, labelText: MTexts.email, prefixIcon: const Icon(Iconsax.direct)),
        ),

        const SizedBox(height: MSize.spaceBtwInputFields,),

        //Phone Number
        TextFormField(
          controller: controller.phoneNumber,
          keyboardType: TextInputType.phone,
          validator: (value) => MValidator.validatePhoneNumber(value),
          decoration:  InputDecoration(floatingLabelStyle: TextStyle(color: MHelperFunction.isDarkMode(context) ? MColors.white : MColors.black),
          labelStyle: Theme.of(context).textTheme.bodyMedium, labelText: MTexts.phoneNo, prefixIcon: const Icon(Iconsax.call)),
        ),

        const SizedBox(height: MSize.spaceBtwInputFields,),

        //Password
        Obx(
          () => TextFormField(
            controller: controller.password,
            validator: (value) => MValidator.validatePassword(value),
            obscureText: controller.hidePassword.value,
            decoration:  InputDecoration(floatingLabelStyle: TextStyle(color: MHelperFunction.isDarkMode(context) ? MColors.white : MColors.black),
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            suffixIcon: IconButton(
            onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
            icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
            labelText: MTexts.password,
            prefixIcon: const Icon(Iconsax.password_check)
            ),
          ),
        ),

        const SizedBox(height: MSize.spaceBtwSections,),

        //Privacy Policy & CheckBox
        const TermsAndConditionCheckbox(),

        const SizedBox(height: MSize.spaceBtwSections,),

        // Create Account
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
          child: const Text(MTexts.createAccount),
          onPressed: () {
            controller.signup();
            },
          ),
        ),
      ],
    ));
  }
}


