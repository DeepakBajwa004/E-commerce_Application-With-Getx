import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/features/personalization/controllers/user_controller.dart';
import 'package:m_store/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';

class ReAuthenticateUser extends StatelessWidget {
  const ReAuthenticateUser({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: MAppBar(
        showBackArrow: true,
        title: Text('Re-Authenticate User' , style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSize.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: MValidator.validateEmail,
                  decoration: const InputDecoration(
                    labelText: MTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
                const SizedBox(height: MSize.spaceBtwInputFields,),
                Obx(
                  ()=> TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) => MValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      labelText: MTexts.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                        icon: controller.hidePassword.value
                            ? const Icon(Iconsax.eye_slash)
                            : const Icon(Icons.remove_red_eye_outlined),
                      )
                    ),
                  ),
                ),
                const SizedBox(height: MSize.spaceBtwSections,),

                // Verify Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()=>controller.reAuthenticateEmailAndPasswordUser() ,
                    child: Text('Verify'),
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
