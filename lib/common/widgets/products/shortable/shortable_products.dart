import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class MShortableProducts extends StatelessWidget {
  const MShortableProducts({
    super.key,
  });




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown
        DropdownButtonFormField(
          onChanged: (value){},
          decoration: InputDecoration(
          prefixIcon: Icon(Iconsax.sort)),
          items: ['Name'  , 'Higher Price' , 'Lower Price' , 'Sale' , 'Newest' , 'Popularity']
              .map((option)=> DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        SizedBox(height: MSize.spaceBtwSections,),
        MGridLayout(itemCount: 3, itemBuilder: (_ , index){
          return MProductCardVertical();
        })
      ],
    );
  }
}
