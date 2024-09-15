import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class MCartItems extends StatelessWidget {
  const MCartItems({super.key,
    this.showAddRemoveButton = true
  });


  final bool showAddRemoveButton;


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: MSize.spaceBtwSections,);  },
      itemBuilder: (BuildContext context, int index) {
        return  Column(
          children: [

            MCartItem(),

           if(showAddRemoveButton) SizedBox(height: MSize.spaceBtwItems,),

            if(showAddRemoveButton)  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70,),
                    MProductQuantityWithAddRemoveButton(),
                  ],
                ),

                MProductPriceText(price: '256')
              ],
            )
          ],
        );
      },
    );
  }
}
