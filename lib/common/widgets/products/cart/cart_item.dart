import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_function.dart';
import '../../images/m_rounded_image.dart';
import '../../texts/brand_title_text_with_verification_icon.dart';
import '../../texts/product_title_text.dart';

class MCartItem extends StatelessWidget {
  const MCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        MRoundedImage(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(MSize.sm),
            backgroundColor: MHelperFunction.isDarkMode(context) ? MColors.darkerGrey : MColors.light,
            imageUrl: MImages.productImage10
        ),
        const SizedBox(width: MSize.spaceBtwItems,),

        // Title , Price , & Brand
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: MProductTitleText(title: 'Red Shoes',maxLines: 1,)),

              /*-----<<<Attributes>>>-----*/
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color  ' ,style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Red ' ,style: Theme.of(context).textTheme.bodyLarge),

                        TextSpan(text: 'Size   ' ,style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'UK 08 ' ,style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  ),
              ),
            ],
          ),
        )
      ],
    );
  }
}