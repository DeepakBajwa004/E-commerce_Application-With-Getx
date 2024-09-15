
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/common/widgets/custom_shape/containers/m_rounded_container.dart';
import 'package:m_store/common/widgets/images/m_rounded_image.dart';
import 'package:m_store/common/widgets/texts/brand_title_text_with_verification_icon.dart';
import 'package:m_store/common/widgets/texts/product_price_text.dart';
import 'package:m_store/common/widgets/texts/product_title_text.dart';
import 'package:m_store/utils/constants/image_strings.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_function.dart';

class MProductCardHorizontal extends StatelessWidget {
  const MProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return Container(
      width: 300,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
      /*-----<<<boxShadow: [MShadowStyle.verticalBoxShadow]>>>-----*/
        color: dark ? MColors.darkerGrey: MColors.softGrey,
        borderRadius:  const BorderRadius.only(
            topLeft: Radius.circular(MSize.productImageRadius),
            topRight:Radius.circular(MSize.productImageRadius),
            bottomLeft: Radius.circular(MSize.productImageRadius),
            bottomRight: Radius.circular(MSize.productImageRadius)
        ),
      ),
      child: Row(
        children: [
          /*-----<<< Thumbnail >>>-----*/
          MRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(MSize.sm),
            backgroundColor: dark ? MColors.dark : MColors.light,
            child: Stack(
              children: [
                /*----- Thumbnail Image ----->>>*/
                const SizedBox(
                  height: 120,
                    width: 120,
                    child: MRoundedImage(imageUrl: MImages.productImage1,applyImageRadius: true,)),


                Positioned(
                  left: 5,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: MSize.sm,vertical: MSize.xs),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MSize.sm),
                        color: MColors.secondary.withOpacity(0.7)),
                    child: Text('25 %',style: Theme.of(context).textTheme.labelLarge!.apply(color: MColors.black),),
                  ),
                ),
                const Positioned(
                    right: 0,
                    top: 0,
                    child: Icon(Iconsax.heart5, color: Colors.red,)
                  // MCircularIcon(icon: Iconsax.heart5, iconColor: Colors.red,),
                ),
              ],
            ),
          ),
          
          // Details
           SizedBox(
            width: 160,
            child: Padding(
              padding: EdgeInsets.only(top: MSize.sm,left: MSize.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MProductTitleText(title: 'Green Nike Half Sleeves Shirt' ,smallSize: true,),
                      SizedBox(height: MSize.spaceBtwItems/2,),
                      MBrandTitleWithVerifiedIcon(title: 'Nike')
                    ],
                  ),

                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: MProductPriceText(price: '256.0')),
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
          )
        ],
      ),
    );
  }
}
