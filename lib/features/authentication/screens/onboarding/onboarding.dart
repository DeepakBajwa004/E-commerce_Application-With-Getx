import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:m_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:m_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:m_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:m_store/utils/constants/image_strings.dart';
import 'package:m_store/utils/constants/text_strings.dart';

import '../../controllers/onboarding/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Page
         PageView(
           controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: MImages.onBoardingImage1,
                title: MTexts.onBoardingTitle1,
                subtitle: MTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: MImages.onBoardingImage2,
                title: MTexts.onBoardingTitle2,
                subtitle: MTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: MImages.onBoardingImage3,
                title: MTexts.onBoardingTitle3,
                subtitle: MTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Skip Button
          const OnboardingSkip(),

          // Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigaton(),

          // Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}






