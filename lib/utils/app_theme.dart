import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBgColor,
    canvasColor: AppColors.whiteColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.mainLightColor,
      unselectedItemColor: AppColors.lightGreyColor,
      selectedLabelStyle: AppStyles.regular12MainLightColor,
      unselectedLabelStyle: AppStyles.regular12GreyColor,
    ),
    cardColor: AppColors.mainLightColor,
    dividerColor: AppColors.strokeWhiteColor,
    textTheme: TextTheme(
      headlineLarge: AppStyles.semi20Black,
      headlineMedium: AppStyles.medium16Black,
      headlineSmall: AppStyles.semi24MainLightColor,
      bodyLarge: AppStyles.regular16Grey,
      bodyMedium: AppStyles.semi16MainLightColor,
      bodySmall: AppStyles.medium14Black,
      labelLarge: AppStyles.semi14MainLightColor,
      labelMedium: AppStyles.medium16MainLightColor,
      labelSmall: AppStyles.medium18MainLightColor,
      titleLarge: AppStyles.regular14MainLightColor,
      titleMedium: AppStyles.medium20Black,
      titleSmall: AppStyles.medium18Black,
      displaySmall: AppStyles.semi14MainLightColor,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBgColor,
    canvasColor: AppColors.inputDarkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBgColor,
      selectedItemColor: AppColors.mainDarkColor,
      unselectedItemColor: AppColors.lightGreyColor,
      selectedLabelStyle: AppStyles.regular12MainDarkColor,
      unselectedLabelStyle: AppStyles.regular12GreyColor,
    ),
    cardColor: AppColors.mainDarkColor,
    dividerColor: AppColors.mainLightColor,
    textTheme: TextTheme(
      headlineLarge: AppStyles.semi20White,
      headlineMedium: AppStyles.medium16White,
      headlineSmall: AppStyles.semi24White,
      bodyLarge: AppStyles.regular16WhiteDarkColor,
      bodyMedium: AppStyles.semi16MainDarkColor,
      bodySmall: AppStyles.medium14White,
      labelLarge: AppStyles.semi14MainDarkColor,
      labelMedium: AppStyles.medium16MainDarkColor,
      labelSmall: AppStyles.medium18White,
      titleLarge: AppStyles.regular14WhiteColor,
      titleMedium: AppStyles.medium20WhiteDarkColor,
      titleSmall: AppStyles.medium18White,
      displaySmall: AppStyles.semi14White,
    ),
  );
}
