import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/common/widgets/icons/m_circular_icon.dart';
import 'package:m_store/utils/constants/colors.dart';
import 'package:m_store/utils/constants/sizes.dart';

import '../../../../../utils/helper/helper_function.dart';

class MBottomAddToCart extends StatelessWidget {
  const MBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return  Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: MSize.defaultSpace,vertical: MSize.defaultSpace),
      decoration: BoxDecoration(
        color: dark ? MColors.darkerGrey : MColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(MSize.cardRadiusLg),
          topRight: Radius.circular(MSize.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const MCircularIcon(
                iconColor: MColors.white,
                  icon: Iconsax.minus,
                backgroundColor: MColors.darkerGrey,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: MSize.spaceBtwItems,),
              Text('2' , style:  Theme.of(context).textTheme.titleSmall,),
              const SizedBox(width: MSize.spaceBtwItems,),

              MCircularIcon(
                iconColor: MColors.white,
                icon: Iconsax.add,
                backgroundColor: MColors.black,
                width: 40,
                height: 40,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(MSize.md),
              backgroundColor: MColors.black,
              side: BorderSide(color: MColors.black),
            ),
              child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
