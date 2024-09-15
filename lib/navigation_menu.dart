import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/features/personalization/screens/settings/settings.dart';
import 'package:m_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:m_store/utils/constants/colors.dart';
import 'package:m_store/utils/helper/helper_function.dart';

import 'features/shop/screens/home/home.dart';
import 'features/shop/screens/store/store.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu( {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = MHelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 70,
          elevation: 0,
          backgroundColor: darkMode ? MColors.black : Colors.white,
          indicatorColor: darkMode ? MColors.white.withOpacity(0.1) : MColors.black.withOpacity(0.1),
          selectedIndex: controller.selectedIndex.value ,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Setting'),
          ],
        ),
      ),
      body: Obx(() =>controller.screen[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController {
  final Rx<int>  selectedIndex= 0.obs;

  final screen =[
    const HomeScreen(),
    const StoreScreen(),
    const WishlistScreen(),
    const SettingsScreen(),
  ];
}
