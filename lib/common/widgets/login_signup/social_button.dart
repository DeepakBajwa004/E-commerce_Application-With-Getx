import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/features/authentication/controllers/login/login_controller.dart';
import 'package:m_store/features/shop/screens/home/home.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';


class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: MColors.grey),
          ),
          child: IconButton(
            onPressed: (){
              controller.googleSignIn(),
            },
            icon: const Image(width: MSize.iconMd, image: AssetImage(MImages.google),),
          ),
        ),
        const SizedBox(width: MSize.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: MColors.grey),
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: MSize.iconMd,
              image: AssetImage(MImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
