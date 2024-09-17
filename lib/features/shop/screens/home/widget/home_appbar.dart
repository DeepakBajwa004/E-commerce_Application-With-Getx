import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:m_store/features/personalization/controllers/user_controller.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class MHomeAppbar extends StatelessWidget {
  const MHomeAppbar({super.key, this.name});

  final name;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return MAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(  MTexts.homeAppBarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: MColors.grey),),
          Obx(() {
            if (controller.profileLoader.value){
               return const MShimmerEffect(width:  80, height: 15,);
            }
            return Text(
            controller.user.value.fullName  , style: Theme.of(context).textTheme.headlineSmall!.apply(color: MColors.white),); }
          )
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
