import 'package:flutter/material.dart';
import 'package:m_store/common/widgets/custom_shape/containers/m_rounded_container.dart';
import 'package:m_store/common/widgets/texts/section_heading.dart';
import 'package:m_store/utils/constants/image_strings.dart';
import 'package:m_store/utils/constants/sizes.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helper/helper_function.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return Column(
      children: [
        MSectionHeading(title: 'Payment Method' , buttonTitle: 'Change', onPressed: (){}),
        SizedBox(height: MSize.spaceBtwItems/2,),
        Row(
          children: [
            MRoundedContainer(
              width: 60,
              height: 35,
              showBorder: false,
              backgroundColor: dark ? MColors.light : MColors.white,
              padding: EdgeInsets.all(MSize.sm),
              child: Image(image: AssetImage(MImages.paypal),fit: BoxFit.contain,),
            ),
            SizedBox(width: MSize.spaceBtwItems/2,),
            Text('PayPal', style: Theme.of(context).textTheme.bodyLarge,),

          ],
        )
      ],
    );
  }
}
