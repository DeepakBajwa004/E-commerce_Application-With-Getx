import 'package:flutter/material.dart';
import 'package:m_store/common/widgets/appbar/appbar.dart';
import 'package:m_store/features/shop/screens/produt_reviews/widgets/rating_progress_indicator.dart';
import 'package:m_store/features/shop/screens/produt_reviews/widgets/user_review_card.dart';
import 'package:m_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/rating/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(title: Text('Reviews & Ratings'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Rating and reviews are verified and are from people who use the same type of device that you use"),
              const SizedBox(height: MSize.spaceBtwItems,),

              //overall product rating
              const MOverallProductRating(),
              const MRatingBarIndicator(rating: 4.2,),

              Text('12,625' ,style:  Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: MSize.spaceBtwSections,),

              // User Review List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}





