import 'package:flutter/material.dart';
import 'package:m_store/common/widgets/custom_shape/containers/m_rounded_container.dart';
import 'package:m_store/common/widgets/images/m_circular_image.dart';
import 'package:m_store/common/widgets/texts/brand_title_text_with_verification_icon.dart';
import 'package:m_store/common/widgets/texts/product_price_text.dart';
import 'package:m_store/common/widgets/texts/product_title_text.dart';
import 'package:m_store/utils/constants/enums.dart';
import 'package:m_store/utils/constants/image_strings.dart';
import 'package:m_store/utils/constants/sizes.dart';
import 'package:m_store/utils/helper/helper_function.dart';

import '../../../../../utils/constants/colors.dart';

class MProductMetaData extends StatelessWidget {
  const MProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & Sale Price
        Row(
          children: [
            MRoundedContainer(
              radius: MSize.sm,
              backgroundColor: MColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: MSize.sm , vertical: MSize.xs),
              child: Text('25%' , style: Theme.of(context).textTheme.labelLarge!.apply(color: MColors.black),),
            ),
            const SizedBox(width: MSize.spaceBtwItems,),

            // Price

            Text('\$250' , style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: MSize.spaceBtwItems,),
            const MProductPriceText(price: '175' , isLarge: true,),

          ],
        ),

        const SizedBox(height: MSize.spaceBtwItems/1.5),
        
        // Title
        const MProductTitleText(title: 'Green Nike Sports Shoes'),
        const SizedBox(height: MSize.spaceBtwItems/1.5),
        
        //Stock status
        Row(
          children: [
            const MProductTitleText(title: 'Status'),
            const SizedBox(width: MSize.spaceBtwItems,),
            Text('In Stock' , style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),

        const SizedBox(height: MSize.spaceBtwItems/1.5),

        // Brand
        Row(
          children: [
            MCircularImage(
              height: 30,
                width: 30,
                overLauColor: dark ? MColors.white : MColors.black,
                image: MImages.nikeLogo
            ),
            const MBrandTitleWithVerifiedIcon(title: 'Nike' , brandTextSize: TextSizes.medium,),
          ],
        ),


      ],
    );
  }
}
