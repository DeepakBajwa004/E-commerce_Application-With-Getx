import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/features/personalization/controllers/user_controller.dart';
import 'package:m_store/utils/constants/text_strings.dart';

import '../../../features/personalization/screens/profile/profile.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/m_circular_image.dart';

class MUserProfileTile extends StatelessWidget {
  const MUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller  = UserController.instance;
    return ListTile(
      leading: const MCircularImage(image: MImages.user,height: 50,width: 50,padding: 0,),
      title: Text(controller.user.value.fullName , style: Theme.of(context).textTheme.headlineSmall!.apply(color: MColors.white),),
      subtitle: Text(controller.user.value.email , style: Theme.of(context).textTheme.bodyMedium!.apply(color: MColors.white),),
      trailing: IconButton(onPressed: ()=> Get.to(()=> const ProfileScreen()),icon: const Icon(Iconsax.edit),color: MColors.white,),
    );
  }
}