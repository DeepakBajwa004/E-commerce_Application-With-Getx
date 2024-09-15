import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helper/helper_function.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MAppBar(
      {super.key,
        this.title,
        this.showBackArrow = false,
        this.leadingIcon,
        this.leadingOnPressed,
        this.actions});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MSize.md),
      child: AppBar(
        automaticallyImplyLeading: showBackArrow,
        title: title,
        actions: actions,
        leading: showBackArrow
            ? IconButton( onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left, color: dark
            ? Colors.white
            : Colors.black,))
            : leadingIcon != null
            ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MDeviceUtils.geAppBarHeight());
}
