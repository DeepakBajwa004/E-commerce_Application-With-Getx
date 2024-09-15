import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/common/widgets/appbar/appbar.dart';
import 'package:m_store/common/widgets/icons/m_circular_icon.dart';
import 'package:m_store/common/widgets/layout/grid_layout.dart';
import 'package:m_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:m_store/navigation_menu.dart';
import 'package:m_store/utils/constants/colors.dart';
import 'package:m_store/utils/constants/sizes.dart';

import '../../../../utils/helper/helper_function.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return Scaffold(
     appBar: MAppBar(
       title: Text('WishList' , style:  Theme.of(context).textTheme.headlineMedium,),
       actions: [
         MCircularIcon(icon: Iconsax.add ,iconColor: dark? MColors.white: MColors.black, onPressed: ()=>Get.offAll(()=>const NavigationMenu()))
       ],
     ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSize.defaultSpace),
          child: Column(
            children: [
              MGridLayout(itemCount: 10, itemBuilder: (_ , context)=> const MProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
