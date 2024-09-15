import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/common/widgets/appbar/appbar.dart';
import 'package:m_store/common/widgets/appbar/m_tabbar.dart';
import 'package:m_store/common/widgets/custom_shape/containers/search_container.dart';
import 'package:m_store/common/widgets/layout/grid_layout.dart';
import 'package:m_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:m_store/common/widgets/brands/brand_card.dart';
import 'package:m_store/common/widgets/texts/section_heading.dart';
import 'package:m_store/features/shop/screens/store/widget/category_tab.dart';
import 'package:m_store/utils/constants/colors.dart';
import 'package:m_store/utils/constants/sizes.dart';
import 'package:m_store/utils/helper/helper_function.dart';

import '../brand/all_brands.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: MAppBar(
          title: Text('Store',style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            MCartCounterIcon(onPeressed: (){},iconColor: dark ? MColors.white: MColors.black,)
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_ ,  innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: MHelperFunction.isDarkMode(context) ?MColors.black : MColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(MSize.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children:  [
                      const SizedBox(height: MSize.spaceBtwItems,),
                      const MSearchContainer(text: 'Search in Store' , showBorder:  true,showBackground: false,padding: EdgeInsets.zero,),
                      const SizedBox(height: MSize.spaceBtwSections,),
                      
                      MSectionHeading(title: 'Featured Brands', onPressed:  ()=> Get.to(()=>AllBrandsScreen()),),
                      const SizedBox(height: MSize.spaceBtwItems/1.5,),
      
                        MGridLayout(
                          mainAxisExtent: 80,
                            itemCount: 4,
                            itemBuilder: (_ , index) {
                              return   const MBrandCard(showBorder: true,);
                            }
                        )
                    ],
                  ),
                ),
                bottom:  const MTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                )
              ),
            ];
          },
          body: const TabBarView(
            children: [
              MCategoryTab(),
              MCategoryTab(),
              MCategoryTab(),
              MCategoryTab(),
              MCategoryTab(),

            ],
          ),
        ),
      ),
    );
  }
}





