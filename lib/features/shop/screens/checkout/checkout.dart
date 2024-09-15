import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/common/widgets/custom_shape/containers/m_rounded_container.dart';
import 'package:m_store/features/shop/screens/checkout/widgets/billing_address_sectionn.dart';
import 'package:m_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:m_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:m_store/navigation_menu.dart';
import 'package:m_store/utils/constants/colors.dart';
import 'package:m_store/utils/constants/image_strings.dart';
import 'package:m_store/utils/constants/sizes.dart';
import 'package:m_store/utils/helper/helper_function.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_code.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../cart/widgets/cart_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return  Scaffold(
      appBar: MAppBar(showBackArrow: true, title: Text('Order Review',style: Theme.of(context).textTheme.headlineSmall,),),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MSize.defaultSpace),
          child: Column(
            children: [
              //-- Items in Cart
              MCartItems(showAddRemoveButton: false),
              SizedBox(height: MSize.spaceBtwItems),

              // Coupon TextField

              MCouponCode(),
              SizedBox(height: MSize.spaceBtwSections),

              // Billing Section
              MRoundedContainer(
                padding: EdgeInsets.all(MSize.md),
                showBorder: true,
                backgroundColor: dark ? MColors.black : MColors.white  ,
                child: Column(
                  children: [
                    //Pricing
                    BillingAmountSection(),
                    SizedBox(height: MSize.spaceBtwItems),

                    //Divider
                    Divider(),
                    SizedBox(height: MSize.spaceBtwItems),

                    //Payment Method
                    BillingPaymentSection(),
                    SizedBox(height: MSize.spaceBtwItems),

                    //Address
                    BillingAddressSection(),

                  ],
                ),
              )



            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MSize.defaultSpace),
        child: ElevatedButton(
          onPressed: ()=> Get.to(()=> SuccessScreen(
            image: MImages.successfulPaymentIcon,
            title: 'Payment Success!',
            subtitle: 'Your item will be shipped soon!',
            onPressed: () => Get.offAll(()=> const NavigationMenu()),
          )),
          child: const Text('Payment \$256'),
        ),
      ),
    );
  }
}

