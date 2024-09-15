import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:m_store/utils/constants/colors.dart';
import 'package:m_store/utils/theme/theme.dart';

import 'bindings/general_bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MAppTheme.lightTheme,
      darkTheme: MAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: Scaffold( backgroundColor: MColors.white,body:
      Center(
        child: LoadingAnimationWidget.dotsTriangle(
        color: MColors.primary,
        size: 30,
          ),
        ),
      ),
    );
  }
}