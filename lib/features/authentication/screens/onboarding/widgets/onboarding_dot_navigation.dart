import 'package:flutter/material.dart';
import 'package:m_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:m_store/utils/helper/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingDotNavigaton extends StatelessWidget {
   const OnBoardingDotNavigaton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = MHelperFunction.isDarkMode(context);
    return Positioned(
      bottom: MDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: MSize.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(activeDotColor: dark ? MColors.light : MColors.dark, dotHeight: 6),
      ),
    );
  }
}
