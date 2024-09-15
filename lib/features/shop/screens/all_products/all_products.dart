import 'package:flutter/material.dart';
import 'package:m_store/common/widgets/appbar/appbar.dart';
import 'package:m_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/shortable/shortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(title: Text('Popular Products'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(MSize.defaultSpace),
          child: MShortableProducts(),
        ),
      ),
    );
  }
}

