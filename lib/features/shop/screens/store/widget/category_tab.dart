import 'package:flutter/material.dart';
import 'package:m_store/common/widgets/layout/grid_layout.dart';
import 'package:m_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:m_store/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class MCategoryTab extends StatelessWidget {
  const MCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      children:[ Padding(padding: const EdgeInsets.all(MSize.defaultSpace),
        child: Column(
          children: [
            const MBrandShowCase(images: [
              MImages.productImage1,
              MImages.productImage2,
              MImages.productImage3,
            ],),
            const MBrandShowCase(images: [
              MImages.productImage1,
              MImages.productImage2,
              MImages.productImage3,
            ],),
            const SizedBox(height: MSize.spaceBtwItems,),
            MSectionHeading(title: 'You might like' , onPressed: (){},),
            const SizedBox(height: MSize.spaceBtwItems,),
      
            MGridLayout(itemCount: 4, itemBuilder: (_ , context ) => const MProductCardVertical()),
            const SizedBox(height: MSize.spaceBtwSections,),
          ],
        ),
      ),
     ]
    );
  }
}
