import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/features/shop/screens/sub_categories/sub_categories.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (_, index) {
            return  MVerticalImageText(
              title: 'Shoes',
              image: MImages.shoeIcon,
              onTap: ()=> Get.to(()=> const SubCategoriesScreen()),
            );
          }),
    );
  }
}