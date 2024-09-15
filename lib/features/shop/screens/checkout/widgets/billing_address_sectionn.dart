import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MSectionHeading(title: 'Shipping  Address' , buttonTitle: 'Change', onPressed: (){}),
        Text('Deepak Bajwa', style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(height: MSize.spaceBtwItems/2,),
        
        Row(
          children: [
            Icon(Icons.phone , color: Colors.grey , size: 16,),
            SizedBox(width: MSize.spaceBtwItems,),
            Text('+91 9992958933', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        SizedBox(height: MSize.spaceBtwItems/2,),

        Row(
          children: [
            Icon(Icons.location_history , color: Colors.grey , size: 16,),
            SizedBox(width: MSize.spaceBtwItems,),
            Text(' Mohali 160062, Punjab, India', style: Theme.of(context).textTheme.bodyMedium,softWrap: true,)
          ],
        ),
        SizedBox(height: MSize.spaceBtwItems/2,),

      ],
    );
  }
}
