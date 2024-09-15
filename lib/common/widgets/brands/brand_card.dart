import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_function.dart';
import '../custom_shape/containers/m_rounded_container.dart';
import '../images/m_circular_image.dart';
import '../texts/brand_title_text_with_verification_icon.dart';

class MBrandCard extends StatelessWidget {
  const MBrandCard({
    super.key, required this.showBorder, this.onTab,
  });

  final bool showBorder;
  final void Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: MRoundedContainer(
        padding: const EdgeInsets.all(MSize.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: MCircularImage(
                isImageNetwork: false,
                backgroundColor: Colors.transparent,
                overLauColor: MHelperFunction.isDarkMode(context) ? MColors.white : MColors.black,
                image: MImages.nikeLogo,
                height: 40,
              ),
            ),

            const SizedBox(height: MSize.spaceBtwItems/2,),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large,),
                  Text('256 products', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}