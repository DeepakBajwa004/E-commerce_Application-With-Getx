import 'package:flutter/material.dart';
import 'package:m_store/common/widgets/appbar/appbar.dart';
import 'package:m_store/common/widgets/images/m_rounded_image.dart';
import 'package:m_store/common/widgets/texts/section_heading.dart';
import 'package:m_store/utils/constants/image_strings.dart';
import 'package:m_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(title: Text('Sports shirts'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(MSize.defaultSpace),
          child: Column(
            children: [
              // Banner
              MRoundedImage( width: double.infinity,height: null, imageUrl:MImages.promoBanner2 ,applyImageRadius: true,),
              SizedBox(height: MSize.spaceBtwSections,),

              //Sub - Categories

              Column(
                children: [
                  MSectionHeading(title: 'Sports shirts' , onPressed: (){},),
                  SizedBox(height: MSize.spaceBtwSections/2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) => const MProductCardHorizontal(),
                      separatorBuilder: (BuildContext context, int index) => SizedBox(width: MSize.spaceBtwItems,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MSize.spaceBtwSections,),
              Column(
                children: [
                  MSectionHeading(title: 'Sports shirts' , onPressed: (){},),
                  SizedBox(height: MSize.spaceBtwSections/2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) => const MProductCardHorizontal(),
                      separatorBuilder: (BuildContext context, int index) => SizedBox(width: MSize.spaceBtwItems,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MSize.spaceBtwSections,),
              Column(
                children: [
                  MSectionHeading(title: 'Sports shirts' , onPressed: (){},),
                  SizedBox(height: MSize.spaceBtwSections/2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) => const MProductCardHorizontal(),
                      separatorBuilder: (BuildContext context, int index) => SizedBox(width: MSize.spaceBtwItems,),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
