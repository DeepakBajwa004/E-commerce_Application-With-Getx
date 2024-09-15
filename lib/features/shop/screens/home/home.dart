import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/features/shop/screens/home/widget/home_appbar.dart';
import 'package:m_store/features/shop/screens/home/widget/home_category.dart';
import 'package:m_store/features/shop/screens/home/widget/promo_slider.dart';
import 'package:m_store/utils/constants/image_strings.dart';
import 'package:m_store/utils/constants/sizes.dart';
import 'package:m_store/utils/helper/helper_function.dart';
import '../../../../common/widgets/custom_shape/containers/primary_headers_container.dart';
import '../../../../common/widgets/custom_shape/containers/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../all_products/all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen( {super.key});

  @override
  Widget build(BuildContext context) {
final dark = MHelperFunction.isDarkMode(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
           MPrimaryHeaderContainer(
            child: Column(
              children: [
                const MHomeAppbar(),

                const SizedBox(height: MSize.spaceBtwSections,),

                const MSearchContainer(text: 'Search in Store',),
                const SizedBox(height: MSize.spaceBtwSections,),

                Padding(padding: const EdgeInsets.only(left: MSize.defaultSpace),
                  child: Column(
                    children: [
                      MSectionHeading( title: 'Popular Categories',  showActionButton: false,  textColor:  dark ? MColors.white : MColors.white, ),
                      const SizedBox(height: MSize.spaceBtwItems,),
                      const HomeCategory(),
                    ],
                  ),
                ),
                const SizedBox(height: MSize.spaceBtwSections,)
              ],
            ),
          ),
          Padding(padding:  const EdgeInsets.all(MSize.defaultSpace),
            child: Column(
              children: [
                const MPromoSlider(
                  banners: [
                   MImages.promoBanner1,
                   MImages.promoBanner2,
                   MImages.promoBanner3,
                    ]
                ),

                const SizedBox(height: MSize.spaceBtwSections,),

                MSectionHeading(title: 'Popular Products',onPressed: ()=> Get.to(()=>const AllProducts()),textColor: dark ? MColors.white : MColors.black,),

                const SizedBox(height: MSize.spaceBtwItems,),

                MGridLayout(itemCount: 5, itemBuilder:(_,index)=>const MProductCardVertical(),),

              ],
            ),
          ),
        ],
      ),
    ));
  }
}






