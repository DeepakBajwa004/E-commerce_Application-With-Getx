import 'package:flutter/material.dart';
import 'package:m_store/features/shop/screens/order/widgets/order_list.dart';
import 'package:m_store/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(title: Text('My Orders' ,style: Theme.of(context).textTheme.headlineMedium),showBackArrow: true),
      body: Padding(
        padding: EdgeInsets.all(MSize.defaultSpace),
        child: MOrderList(),
      ),
    );
  }
}
