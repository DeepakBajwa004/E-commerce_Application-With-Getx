import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class MRoundedContainer extends StatelessWidget {
  const MRoundedContainer(
      {super.key,
        this.width,
        this.height,
        this.radius = MSize.cardRadiusLg,
        this.child,
        this.showBorder = true,
        this.borderColor = MColors.grey,
        this.backgroundColor = MColors.darkerGrey,
        this.padding,
        this.margin
      });


  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null
      ),
      child: child,
    );
  }
}
