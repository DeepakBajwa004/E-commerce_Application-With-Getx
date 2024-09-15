import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/utils/constants/colors.dart';
import 'package:m_store/utils/constants/sizes.dart';
import 'package:m_store/utils/helper/helper_function.dart';

import '../../../../../common/widgets/custom_shape/containers/m_rounded_container.dart';

class MSingleAddress extends StatelessWidget {
  const MSingleAddress({super.key, required this.selectedAddress});


  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return  MRoundedContainer(
      padding: const EdgeInsets.all(MSize.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? MColors.primary.withOpacity(0.5) : Colors.transparent ,
      borderColor: selectedAddress ? Colors.transparent : dark ? MColors.darkerGrey : MColors.grey,
      margin: const EdgeInsets.only(bottom: MSize.spaceBtwItems),
      child: Stack(
        children: [
        Positioned(
          right: 5,
          top: 0,
          child: Icon(
            selectedAddress?  Iconsax.tick_circle5  : null,
            color: selectedAddress ? dark ? MColors.light : MColors.dark.withOpacity(0.6) : null,
          ),
        ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( 'Deepak Bajwa', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: MSize.sm/2,),
              const Text('+91 9992958933',maxLines: 1,overflow: TextOverflow.ellipsis,),
              const SizedBox(height: MSize.sm/2,),
              
              Text('Sector 65 Mohali, Punjab 160062 , India',softWrap: true,style: Theme.of(context).textTheme.bodyMedium),

            ],
          )
        ],
      ),
    );
  }
}
