import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_function.dart';

class MCircularImage extends StatelessWidget {
  const MCircularImage({
    super.key,
    this.height = 56,
    this.width = 56,
    this.padding = MSize.sm,
    this.fit = BoxFit.cover,
    required this.image,
    this.isImageNetwork = false,
    this.overLauColor,
    this.backgroundColor,
  });

  final double height, width, padding;
  final BoxFit? fit;
  final String image;
  final bool isImageNetwork;
  final Color? overLauColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor??  (MHelperFunction.isDarkMode(context) ? MColors.black : MColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: Image(
        fit: fit,
        height: height,
        image: isImageNetwork ? NetworkImage(image ) : AssetImage(image) as ImageProvider,
        color: overLauColor
      ),
    );
  }
}
