import 'package:flutter/material.dart';
import 'package:m_store/features/shop/screens/produt_reviews/widgets/product_rating_progress_indicator.dart';

class MOverallProductRating extends StatelessWidget {
  const MOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3,child: Text('4.2' , style:  Theme.of(context).textTheme.displayLarge,)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              MRatingProgressIndicator(text: '5', value: 1.0,),
              MRatingProgressIndicator(text: '4', value: 0.8,),
              MRatingProgressIndicator(text: '3', value: 0.6,),
              MRatingProgressIndicator(text: '2', value: 0.4,),
              MRatingProgressIndicator(text: '1', value: 0.2,),

            ],
          ),
        )
      ],
    );
  }
}