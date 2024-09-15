import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/utils/helper/helper_function.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shape/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/m_circular_icon.dart';
import '../../../../../common/widgets/images/m_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class MProductImageSlider extends StatelessWidget {
  const MProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return MCurvedEdgeWidget(
      child: Container(
        color: dark ? MColors.darkerGrey : MColors.light,
        child:  Stack(
          children: [
            const SizedBox(height: 400,child: Padding(
              padding: EdgeInsets.all(MSize.productImageRadius*2),
              child: Center(child: Image(image: AssetImage(MImages.productImage7))),
            )),

            Positioned(
              right: 0,
              bottom: 30,
              left: MSize.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) { return const SizedBox(width: MSize.spaceBtwItems,); },
                  itemBuilder: (BuildContext context, int index) {
                    return MRoundedImage(
                        width: 80,
                        border: Border.all(color: MColors.primary),
                        padding: const EdgeInsets.all(MSize.sm),
                        backgroundColor: dark? MColors.dark : MColors.white,
                        imageUrl: MImages.productImage3
                    );
                  },
                ),
              ),
            ),
            const MAppBar(
              showBackArrow: true,
              actions: [
                MCircularIcon(icon: Iconsax.heart5, iconColor: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }
}