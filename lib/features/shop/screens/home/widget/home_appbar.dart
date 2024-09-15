import 'package:flutter/material.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class MHomeAppbar extends StatelessWidget {
  const MHomeAppbar({super.key, this.name});

  final name;
  @override
  Widget build(BuildContext context) {
    return MAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(  MTexts.homeAppBarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: MColors.grey),),
          Text(  name, style: Theme.of(context).textTheme.headlineSmall!.apply(color: MColors.white),)
        ],
      ),
      actions: [
        MCartCounterIcon(
          onPeressed: () {},
          iconColor: MColors.white,
        ),
      ],
    );
  }
}
