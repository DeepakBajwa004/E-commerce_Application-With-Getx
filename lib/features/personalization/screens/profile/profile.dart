import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/common/widgets/appbar/appbar.dart';
import 'package:m_store/common/widgets/images/m_circular_image.dart';
import 'package:m_store/common/widgets/texts/section_heading.dart';
import 'package:m_store/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:m_store/utils/constants/image_strings.dart';
import 'package:m_store/utils/constants/sizes.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

              MProfileMenu(title: 'Name', value: 'Deepak Bajwa',onPressed: () {  },),
              MProfileMenu(title: 'Username', value: 'deepak_bajwa98',onPressed: () {  },),

              /*-----<<<Divider>>>------*/
              const SizedBox(height: MSize.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: MSize.spaceBtwItems),

              /*-----<<<Personal Information>>>------*/
              const MSectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: MSize.spaceBtwItems),

              MProfileMenu(title: 'User ID', value: '48293',icon: Iconsax.copy,onPressed: () {  },),
              MProfileMenu(title: 'E-mail', value: 'bajwadeepak98@gmail.com',onPressed: () {  },),
              MProfileMenu(title: 'Phone No', value: '9992958933',onPressed: () {  },),
              MProfileMenu(title: 'Gender', value: 'Male',onPressed: () {  },),
              MProfileMenu(title: 'D.O.B', value: '07 November, 2003',onPressed: () {  },),

              /*-----<<<Divider>>>------*/
              const Divider(),
              const SizedBox(height: MSize.spaceBtwItems),

              Center(
                child: TextButton(
                    onPressed: (){},
                    child: const Text('Delete Account',style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
        ),
      )
    );
  }
}


