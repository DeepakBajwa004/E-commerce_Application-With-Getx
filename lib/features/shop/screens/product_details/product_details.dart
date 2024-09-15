 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/common/widgets/texts/section_heading.dart';
import 'package:m_store/features/shop/screens/cart/cart.dart';
import 'package:m_store/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:m_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:m_store/features/shop/screens/product_details/widgets/product_detail_slider.dart';
import 'package:m_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:m_store/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:m_store/utils/constants/sizes.dart';
import 'package:m_store/utils/helper/helper_function.dart';
import 'package:readmore/readmore.dart';

import '../produt_reviews/product_reviews.dart';


class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            const MProductImageSlider(),

            /// Product Details
            
            Padding(
                padding: const EdgeInsets.only(right: MSize.defaultSpace,left: MSize.defaultSpace,bottom: MSize.defaultSpace),
              child: Column(
                children: [
                  //Rating And share Button
                  const MRatingAndShare(),

                  // Price , title , Stock & Brand
                  const MProductMetaData(),

                  // Attributes
                  const ProductAttributes(),
                  const SizedBox(height: MSize.spaceBtwSections,),

                  // CheckOut Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.to(()=>CartScreen()), child: const Text('Checkout')),),
                  const SizedBox(height: MSize.spaceBtwSections,),

                  //Description
                  const MSectionHeading(title: 'Description' , showActionButton: false,),
                  const SizedBox(height: MSize.spaceBtwItems,),

                  const ReadMoreText(
                    'This is a product description for blue Nike Shoes. There are more things that can be added but i am vsfvflmmlsmfv;x;snsf;xn ;jfnv;kjfdn;knvjksnfx;kjn;jsnsvsrosl;nmdkjvnsj;k s s;v nfjl; onv;jl ',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  //Reviews
                  const Divider(),
                  const SizedBox(height: MSize.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MSectionHeading(title: 'Reviews (199)' , showActionButton: false, ),
                      IconButton(onPressed: ()=> Get.to(()=> const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3 , size:  18 , ))
                    ],
                  ),
                  const SizedBox(height: MSize.spaceBtwItems,),



                ],
              ),
            )
            
          ],
        ),
      ),
      bottomNavigationBar: const MBottomAddToCart(),
    );
  }
}




