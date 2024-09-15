import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helper/helper_function.dart';
class MCircularIcon extends StatelessWidget {
  const MCircularIcon({
    super.key,
    this.iconColor,
    this.backgroundColor,
    this.onPressed,
    this.height,
    this.width,
    required this.icon,
    this.size,
  });

  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed ;
  final IconData icon;
  final double? height , width , size ;
  @override
  Widget build(BuildContext context) {
    final bool dark=MHelperFunction.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor!=null
            ? backgroundColor!: MHelperFunction.isDarkMode(context)
            ? MColors.black.withOpacity(0.9)
            : MColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(child: IconButton(onPressed: (){},icon: Icon(icon,color: iconColor,size: size,),color:iconColor ,)),
    );
  }
}
