import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/common/widgets/appbar/appbar.dart';
import 'package:m_store/common/widgets/custom_shape/containers/primary_headers_container.dart';
import 'package:m_store/common/widgets/texts/section_heading.dart';
import 'package:m_store/features/personalization/screens/address/address.dart';
import 'package:m_store/features/shop/screens/cart/cart.dart';
import 'package:m_store/utils/constants/sizes.dart';

import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../shop/screens/order/order.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Headers
            MPrimaryHeaderContainer(
                child: Column(
                  children: [

                    //AppBar
                    MAppBar(title: Text('Account' ,style: Theme.of(context).textTheme.headlineMedium!.apply(color :MColors.white),),),

                    //UserProfile Card
                    const MUserProfileTile(),
                    const SizedBox(height: MSize.spaceBtwSections,),
                  ],
                )
            ),

            //Body

             Padding(padding: const EdgeInsets.all(MSize.defaultSpace),
             child: Column(
              children: [
                const MSectionHeading(title: 'Account Settins',showActionButton: false,),

                const SizedBox(height: MSize.spaceBtwItems,),

                 MSettingsMenuTile(
                  onTap: ()=> Get.to(()=> const UserAddressScreen()),
                  icon: Iconsax.safe_home,
                  title: 'My Addresses',
                  subTitle: 'Set shopping delivery address'
                ),
                 MSettingsMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: "My Cart",
                  subTitle: "Add, remove products and move to checkout",
                  onTap: ()=> Get.to(()=> const CartScreen()),
                ),
                 MSettingsMenuTile(
                   icon: Iconsax.bag_tick,
                   title: "My Orders",
                   subTitle: "In-progress and Completed Orders",
                   onTap: ()=> Get.to(()=> const OrderScreen()),
                ),
                 MSettingsMenuTile(
                   icon: Iconsax.bank,
                   title: "Bank Account",
                   subTitle: "Withdraw balance to registered bank account",
                   onTap: () {},
                ),
                 MSettingsMenuTile(
                   icon: Iconsax.discount_shape,
                   title: "My Coupons",
                   subTitle: "List of all the discounted coupons",
                   onTap: () {},
                ),
                 MSettingsMenuTile(
                   icon: Iconsax.notification,
                   title: "Notifications",
                   subTitle: "Set any kind of notification message",
                   onTap: () {},
                ),
                 MSettingsMenuTile(
                     icon: Iconsax.security_card,
                     title: "Account Privacy",
                     subTitle: "Manage data usage and connected account",
                     onTap: () {}
                ),

                const SizedBox(height: MSize.spaceBtwSections,),

                const MSectionHeading(title: 'App Settins',showActionButton: false,),

                const SizedBox(height: MSize.spaceBtwItems,),

                 const MSettingsMenuTile(
                     icon: Iconsax.document_upload,
                     title: "Load Data",
                     subTitle: "Upload Data to your Cloud Firebase"
                ),

                 MSettingsMenuTile(
                   icon: Iconsax.location,
                   title: "Geolocation",
                   subTitle: "Set recommendation based on location",
                   trailing: Switch(
                     value: true,
                     onChanged: (value) {},
                   ),
                ),
                 MSettingsMenuTile(
                   icon: Iconsax.security_user,
                   title: "Safe Mode",
                   subTitle: "Search result is safe for all ages",
                   trailing: Switch(
                     value: false,
                     onChanged: (value) {},
                   ),
                ),
                 MSettingsMenuTile(
                   icon: Iconsax.image,
                   title: "HD Image Quality",
                   subTitle: "Set image quality to be seen",
                   trailing: Switch(
                     value: false,
                     onChanged: (value) {},
                   ),
                ),

                const SizedBox(height: MSize.spaceBtwSections,),

                //Logout Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: (){},
                    child:const Text('Logout'),
                  ),
                ),

                const SizedBox(height: MSize.spaceBtwSections*2.5,),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}


