import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_function.dart';
import '../custom_shape/containers/m_rounded_container.dart';
import 'brand_card.dart';

class MBrandShowCase extends StatelessWidget {
  const MBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return MRoundedContainer(
      padding: const EdgeInsets.all(MSize.md),
      showBorder: true,
      borderColor: MColors.darkerGrey,
      margin: const EdgeInsets.only( bottom:MSize.spaceBtwItems),
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*-----<<<brand with product count>>>-----*/
          const MBrandCard(showBorder: false,),
          const SizedBox(height: MSize.spaceBtwItems,),
          /*-----<<<brand top 3 products>>-----*/
          Row(
            mainAxisSize: MainAxisSize.min,
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: MRoundedContainer(
        height: 100,
        backgroundColor: MHelperFunction.isDarkMode(context) ? MColors.darkerGrey : MColors.light,
        margin: const EdgeInsets.only(right: MSize.sm),
        padding: const EdgeInsets.all(MSize.md),
        child: Image(fit: BoxFit.contain,image: AssetImage(image),),
      ),
    );
  }
}