import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_function.dart';

class MVerticalImageText extends StatelessWidget {
  const MVerticalImageText({
    super.key,
    required this.title,
    required this.image,
    this.textColor = MColors.white,
    this.backgroundColor = MColors.white,
    this.onTap,
  });

  final String title, image;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MSize.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding:  const EdgeInsets.all(MSize.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ?? (dark ? MColors.black: MColors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(child: Image(image: AssetImage(image), fit: BoxFit.cover, color: dark ? MColors.black: MColors.black,),),
            ),
            const SizedBox(height: MSize.spaceBtwItems / 2),
            SizedBox(
                width: 55,
                child: Text(title, style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,)
            ),
          ],
        ),
      ),
    );
  }
}