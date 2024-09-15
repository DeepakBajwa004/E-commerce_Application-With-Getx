import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/common/widgets/appbar/appbar.dart';
import 'package:m_store/features/personalization/screens/address/widgets/add_new_address.dart';
import 'package:m_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:m_store/utils/constants/colors.dart';
import 'package:m_store/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(()=> const UserAddNewAddress()),
        backgroundColor: MColors.primary,
        child: const Icon(Iconsax.add , color: MColors.white,),
      ),
      appBar: MAppBar(
        showBackArrow: true,
        title: Text('Addresses' , style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body:  const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MSize.defaultSpace),
          child: Column(
            children: [
              MSingleAddress(selectedAddress: true),
              MSingleAddress(selectedAddress: false),
              MSingleAddress(selectedAddress: false),
              MSingleAddress(selectedAddress: false),
              MSingleAddress(selectedAddress: false),
              MSingleAddress(selectedAddress: false),
              MSingleAddress(selectedAddress: false),


            ],
          ),
        ),
      ),
    );
  }
}
