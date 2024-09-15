import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_function.dart';
import '../../icons/m_circular_icon.dart';

class MProductQuantityWithAddRemoveButton extends StatelessWidget {
  const MProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        /*-----<<<Add Remove Button>>>-----*/
        MCircularIcon(
          size: MSize.md,
          height: 30,
          width: 30,
          icon: Iconsax.minus,
          iconColor: MHelperFunction.isDarkMode(context) ? MColors.white : MColors.black,
          backgroundColor: MHelperFunction.isDarkMode(context) ? MColors.darkerGrey : MColors.light,
        ),

        const SizedBox(width: MSize.spaceBtwItems,),

        Text('2' , style: Theme.of(context).textTheme.titleSmall,),

        const SizedBox(width: MSize.spaceBtwItems,),

        const MCircularIcon(
          size: MSize.md,
          height: 30,
          width: 30,
          icon: Iconsax.add,
          iconColor: MColors.white ,
          backgroundColor:  MColors.primary,
        ),
      ],
    );
  }
}