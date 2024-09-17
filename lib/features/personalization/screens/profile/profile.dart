import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/common/widgets/appbar/appbar.dart';
import 'package:m_store/common/widgets/images/m_circular_image.dart';
import 'package:m_store/common/widgets/texts/section_heading.dart';
import 'package:m_store/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:m_store/features/personalization/screens/profile/widget/update_name.dart';
import 'package:m_store/utils/constants/image_strings.dart';
import 'package:m_store/utils/constants/sizes.dart';

import '../../controllers/user_controller.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller  = UserController.instance;
    return Scaffold(
      appBar: const MAppBar(showBackArrow: true, title: Text('Profile'),),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(MSize.defaultSpace),
          child: Column(
            children: [
              /*-----<<<Profile Picture>>>------*/
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const MCircularImage(image: MImages.user,width: 80,height: 80),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture'))
                  ],
                ),
              ),

              /*-----<<<Divider>>>------*/
              const SizedBox(height: MSize.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: MSize.spaceBtwItems),

              /*-----<<<Profile Information>>>------*/
              const MSectionHeading(title: 'Profile Information', showActionButton: false,),
              const SizedBox(height: MSize.spaceBtwItems),

              MProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: ()=> Get.to(()=>const ChangeName()),),
              MProfileMenu(title: 'Username', value: controller.user.value.userName ,onPressed: () {  },),

              /*-----<<<Divider>>>------*/
              const SizedBox(height: MSize.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: MSize.spaceBtwItems),

              /*-----<<<Personal Information>>>------*/
              const MSectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: MSize.spaceBtwItems),

              MProfileMenu(title: 'User ID', value: controller.user.value.id,icon: Iconsax.copy,onPressed: () {  },),
              MProfileMenu(title: 'E-mail', value: controller.user.value.email,onPressed: () {  },),
              MProfileMenu(title: 'Phone No', value: controller.user.value.phoneNo,onPressed: () {  },),
              MProfileMenu(title: 'Gender', value: 'Male',onPressed: () {  },),
              MProfileMenu(title: 'D.O.B', value: '07 November, 2003',onPressed: () {  },),

              /*-----<<<Divider>>>------*/
              const Divider(),
              const SizedBox(height: MSize.spaceBtwItems),

              Center(
                child: TextButton(
                    onPressed: ()=> controller.deleteAccountWarningPopup(),
                    child: const Text('Delete Account',style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
        ),
      )
    );
  }
}


