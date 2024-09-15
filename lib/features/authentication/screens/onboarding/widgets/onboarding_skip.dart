import 'package:flutter/material.dart';
import 'package:m_store/features/authentication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MDeviceUtils.geAppBarHeight(),
        right: MSize.defaultSpace,
        child: TextButton(
          onPressed: () => OnboardingController.instance.skipPage(),
          child: Text('Skip',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
    );
  }
}