import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/common/widgets/appbar/appbar.dart';
import 'package:m_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:m_store/utils/constants/sizes.dart';

import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: MAppBar(showBackArrow: true, title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall,),),
      body: const Padding(
        padding: EdgeInsets.all(MSize.defaultSpace),
        child: MCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MSize.defaultSpace),
        child: ElevatedButton(
          onPressed: ()=> Get.to(()=> CheckoutScreen()),
          child: const Text('Checkout \$256'),
        ),
      ),
    );
  }
}




