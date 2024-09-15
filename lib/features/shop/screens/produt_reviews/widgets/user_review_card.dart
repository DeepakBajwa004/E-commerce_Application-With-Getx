import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:m_store/common/widgets/custom_shape/containers/m_rounded_container.dart';
import 'package:m_store/common/widgets/products/rating/rating_indicator.dart';
import 'package:m_store/utils/constants/image_strings.dart';
import 'package:m_store/utils/constants/sizes.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helper/helper_function.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(MImages.userProfileImage1),),
                const SizedBox(width: MSize.spaceBtwItems,),
                Text('John Doe' , style:  Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: MSize.spaceBtwItems,),

        // Review
        Row(
          children: [
            const MRatingBarIndicator(rating: 4),
            const SizedBox(width: MSize.spaceBtwItems,),
            Text('01 July, 2024' ,style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),

         const AnimatedReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchsaes seamlessly. Great job,The user interface of the app is quite intuitive. I was able to navigate and make purchsaes seamlessly. Great job!',
          readLessText: 'show less',
          readMoreText: 'show more',
          maxLines: 3,
           animationCurve: Curves.easeInOut,
           animationDuration: Duration(milliseconds: 450),
          buttonTextStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: MColors.primary),
        ),
        const SizedBox(height: MSize.spaceBtwItems,),

        //Company Review
        MRoundedContainer(
         backgroundColor: dark ? MColors.darkerGrey : MColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(MSize.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('M Store' ,style:  Theme.of(context).textTheme.bodyLarge,),
                    Text('02 July, 2024' , style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const AnimatedReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate and make purchsaes seamlessly. Great job,The user interface of the app is quite intuitive. I was able to navigate and make purchsaes seamlessly. Great job!',
                  readLessText: 'show less',
                  readMoreText: 'show more',
                  maxLines: 3,
                  animationCurve: Curves.easeInOut,
                  animationDuration: Duration(milliseconds: 350),
                  buttonTextStyle: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold, color: MColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: MSize.spaceBtwSections,)

      ],
    );
  }
}
