import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/utils/constants/colors.dart';

import '../../../../../common/widgets/custom_shape/containers/circular_container.dart';
import '../../../../../common/widgets/images/m_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home_controller.dart';

class MPromoSlider extends StatelessWidget {
  const MPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
              viewportFraction: 1,
            onPageChanged: (index , _ )=> controller.updatePageIndicator(index)

          ),
          items: banners.map((url)=> MRoundedImage(imageUrl: url)).toList()
        ),
        const SizedBox(height: MSize.spaceBtwItems,),

        Obx(
            ()=> Row(
              mainAxisSize: MainAxisSize.min,
            children: [
              for(int i =0  ;i < banners.length; i++)
                MCircularContainer(
                  margin: const EdgeInsets.only(right: 10),
                  width: 20,
                  height: 4,
                  backgroundColor:controller.carousalcurrentIndex.value == i ?MColors.primary : MColors.grey,
                ),
            ],
          ),
        )
      ],
    );
  }
}