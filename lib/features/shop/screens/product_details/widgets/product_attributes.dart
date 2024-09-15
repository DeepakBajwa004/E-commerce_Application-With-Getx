import 'package:flutter/material.dart';
import 'package:m_store/common/widgets/custom_shape/containers/m_rounded_container.dart';
import 'package:m_store/common/widgets/texts/product_price_text.dart';
import 'package:m_store/common/widgets/texts/product_title_text.dart';
import 'package:m_store/common/widgets/texts/section_heading.dart';
import 'package:m_store/utils/constants/colors.dart';
import 'package:m_store/utils/constants/sizes.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/helper/helper_function.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return  Column(
      children: [
        // Selected Attributes Pricing & Description
        MRoundedContainer(
          padding: const EdgeInsets.all(MSize.md),
          backgroundColor: dark? MColors.darkerGrey : MColors.grey ,
          child: Column(
            children: [
              // Title , Price and Stock Status
              Row(
                children: [
                  const MSectionHeading(title: 'Variation' , showActionButton: false,),
                  const SizedBox(width: MSize.spaceBtwItems,),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const MProductTitleText(title: 'Price  : ' , smallSize: true,),

                          // Actual Price
                          Text('\$25' , style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),

                          const SizedBox(width: MSize.spaceBtwItems,),
                          // Sale Price
                          const MProductPriceText(price: '20',),
                        ],
                      ),

                      // Stock
                      Row(
                        children: [
                          const MProductTitleText(title: 'Stock : ' , smallSize: true,),

                          Text('In Stock' , style: Theme.of(context).textTheme.titleMedium,)
                        ],
                      )
                    ],
                  ),
                ],
              ),

              // Variation Description
              const MProductTitleText(
                  title: 'This is the Description of the Product and it can go up to max 4 lines.',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: MSize.spaceBtwItems,),

        //Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MSectionHeading(title: 'Colors',showActionButton: false,),
            const SizedBox(height: MSize.spaceBtwItems/2,),
            Wrap(
              spacing: 8,
              children: [
                MChoiceChip(text: 'Green', selected: true, onSelected: (value) {},),
                MChoiceChip(text: 'Blue', selected: false, onSelected: (value) {}),
                MChoiceChip(text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MSectionHeading(title: 'Size',showActionButton: false,),
            const SizedBox(height: MSize.spaceBtwItems/2,),
            Wrap(
              spacing: 8,
              children: [
                MChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {}),
                MChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {}),
                MChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {}),

              ],
            )
          ],
        ),

      ],
    );
  }
}


