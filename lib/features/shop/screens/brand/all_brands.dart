import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/common/widgets/appbar/appbar.dart';
import 'package:m_store/common/widgets/brands/brand_card.dart';
import 'package:m_store/common/widgets/layout/grid_layout.dart';
import 'package:m_store/common/widgets/texts/section_heading.dart';
import 'package:m_store/utils/constants/sizes.dart';

import 'brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: MAppBar(title: Text('Brand'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(MSize.defaultSpace),
          child: Column(
            children: [
              MSectionHeading(title: 'Brands' ,showActionButton: false,),
              SizedBox(height: MSize.spaceBtwItems,),

              MGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index){
                    return MBrandCard(showBorder: true,onTab: ()=> Get.to(()=> BrandProducts())  );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
