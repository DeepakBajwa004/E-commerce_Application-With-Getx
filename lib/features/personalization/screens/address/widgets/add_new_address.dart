import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/common/widgets/appbar/appbar.dart';
import 'package:m_store/utils/constants/sizes.dart';

class UserAddNewAddress extends StatelessWidget {
  const UserAddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(showBackArrow: true, title: Text('Add new Address'),),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(MSize.defaultSpace),
          child: Form(
              child: Column(
                children: [
                  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name'),),
                  const SizedBox(height: MSize.spaceBtwInputFields,),
                  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number'),),
                  const SizedBox(height: MSize.spaceBtwInputFields,),

                  Row(
                    children: [
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'),)),
                      const SizedBox(width: MSize.spaceBtwInputFields,),
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Pin Code'),)),

                    ],
                  ),

                  const SizedBox(height: MSize.spaceBtwInputFields,),

                  Row(
                    children: [
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building),labelText: 'City'),)),
                      const SizedBox(width: MSize.spaceBtwInputFields,),
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'State'),)),

                    ],
                  ),

                  const SizedBox(height: MSize.spaceBtwInputFields,),

                  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Country'),),

                  const SizedBox(height: MSize.defaultSpace,),

                  SizedBox(width : double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text('Save',)))

                ],
              )
          ),
        ),
      ),
    );
  }
}
