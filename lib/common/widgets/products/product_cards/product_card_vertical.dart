
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/common/widgets/images/m_rounded_image.dart';
import 'package:m_store/features/shop/screens/product_details/product_details.dart';
import 'package:m_store/utils/constants/colors.dart';
import 'package:m_store/utils/constants/image_strings.dart';
import 'package:m_store/utils/constants/sizes.dart';
import 'package:m_store/utils/helper/helper_function.dart';
import '../../../styles/shadow.dart';
import '../../texts/brand_title_text_with_verification_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class MProductCardVertical extends StatelessWidget {
  const MProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: ()=> Get.to(()=> const ProductDetailsScreen()),
      child: Container(
        width: 180,
        height: 270,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [MShadowStyle.verticalBoxShadow],
          borderRadius:  const BorderRadius.only(
            topLeft: Radius.circular(MSize.productImageRadius),
                topRight:Radius.circular(MSize.productImageRadius),
            bottomLeft: Radius.circular(MSize.productImageRadius),
             bottomRight: Radius.circular(MSize.productImageRadius)
          ),
          color: dark ? MColors.dark.withOpacity(0.8) : MColors.light,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 170,
              padding: const EdgeInsets.all(MSize.sm),
              decoration: BoxDecoration(
                  color: dark ? MColors.dark : MColors.light,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
              ),
              child:  Stack(
                children: [
                  SizedBox(
                     height: 180,
                     child: MRoundedImage(imageUrl: MImages.productImage10,applyImageRadius: true,backgroundColor: dark ? MColors.dark : MColors.light ,padding: const EdgeInsets.only(top:MSize.xs),)),

              Positioned(
                left: 5,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: MSize.sm,vertical: MSize.xs),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MSize.sm),
                      color: MColors.secondary.withOpacity(0.7)),
                  child: Text('25 %',style: Theme.of(context).textTheme.labelLarge!.apply(color: MColors.black),),
                  ),
              ),
                  const Positioned(
                    right: 5,
                    top: 12,
                    child: Icon(Iconsax.heart5, color: Colors.red,)
                   // MCircularIcon(icon: Iconsax.heart5, iconColor: Colors.red,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: MSize.spaceBtwItems/1.5,),
             const Padding(
              padding: EdgeInsets.only(left: MSize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MProductTitleText(title: 'Green Nike Air Shoes',smallSize: true,),
                  SizedBox(height: MSize.spaceBtwItems/1,),


                  MBrandTitleWithVerifiedIcon(title: 'Nike',),


                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding:  EdgeInsets.only(left :MSize.sm),
                  child: MProductPriceText(price: '35.0',isLarge: true,),
                ),

                Container(
                  decoration:  BoxDecoration(
                      color: MColors.black,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(MSize.cardRadiusMd),
                          bottomRight: Radius.circular(MSize.productImageRadius)
                      )
                  ),
                  child: const SizedBox(
                      width: MSize.iconLg*1.3,
                      height: MSize.iconLg*1.1+5-2,
                      child: Center(child: Icon(Iconsax.add,color: MColors.white,))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}







