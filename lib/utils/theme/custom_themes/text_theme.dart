import 'package:flutter/material.dart';
import 'package:m_store/utils/constants/colors.dart';


class MTextTheme {
  MTextTheme._();


  static TextTheme lightTextTheme = TextTheme(
    headlineLarge:const TextStyle().copyWith(fontSize: 32,fontWeight: FontWeight.bold,color: MColors.dark),
    headlineMedium:const TextStyle().copyWith(fontSize: 24,fontWeight: FontWeight.w600,color: MColors.dark),
    headlineSmall:const TextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w600,color: MColors.dark),

    titleLarge:const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w600,color: MColors.dark),
    titleMedium:const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: MColors.dark),
    titleSmall:const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: MColors.dark),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0,fontWeight: FontWeight.w500,color: MColors.dark,),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0,fontWeight: FontWeight.normal,color: MColors.dark,),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0,fontWeight: FontWeight.w500,color: MColors.dark.withOpacity(0.5),),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0,fontWeight: FontWeight.normal,color: MColors.dark),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0,fontWeight: FontWeight.normal,color: MColors.dark.withOpacity(0.5),),

  );


  static TextTheme darkTextTheme = TextTheme(
    headlineLarge:const TextStyle().copyWith(fontSize: 32,fontWeight: FontWeight.bold,color: MColors.light),
    headlineMedium:const TextStyle().copyWith(fontSize: 24,fontWeight: FontWeight.w600,color: MColors.light),

    headlineSmall:const TextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w600,color: MColors.light),

    titleLarge:const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w600,color: MColors.light),
    titleMedium:const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: MColors.light),
    titleSmall:const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: MColors.light),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0,fontWeight: FontWeight.w500,color: MColors.light,),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0,fontWeight: FontWeight.normal,color: MColors.light,),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0,fontWeight: FontWeight.w500,color: MColors.light.withOpacity(0.5),),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0,fontWeight: FontWeight.normal,color: MColors.light),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0,fontWeight: FontWeight.normal,color: MColors.light.withOpacity(0.5),),

  );
}