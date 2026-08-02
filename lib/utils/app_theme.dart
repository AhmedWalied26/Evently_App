import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/custom_page_trans.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomPageTransitionsBuilder(),
        TargetPlatform.iOS: CustomPageTransitionsBuilder(),
      },
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.whiteColor,
      hourMinuteColor: AppColors.mainLightColor,
      hourMinuteTextColor: AppColors.whiteColor,
      dayPeriodColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.mainLightColor;
        }
        return Colors.white;
      }),
      dayPeriodTextColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return AppColors.mainLightColor;
      }),
      dialBackgroundColor: AppColors.mainLightColor.withValues(alpha: .12),
      dialHandColor: AppColors.mainLightColor,
      dialTextColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.whiteColor;
        }
        return AppColors.mainLightColor;
      }),
      entryModeIconColor: AppColors.mainLightColor,
      cancelButtonStyle: TextButton.styleFrom(foregroundColor: Colors.red),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.mainLightColor,
      ),
      helpTextStyle: const TextStyle(
        color: AppColors.mainLightColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      hourMinuteTextStyle: const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      dayPeriodTextStyle: const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.whiteColor,
      headerBackgroundColor: AppColors.mainLightColor,
      headerForegroundColor: AppColors.whiteColor,
      weekdayStyle: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w600,
      ),
      dayStyle: const TextStyle(color: AppColors.mainDarkColor),
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.mainLightColor;
        }
        return Colors.transparent;
      }),

      dayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.whiteColor;
        }
        return AppColors.mainLightColor;
      }),
      todayBackgroundColor: WidgetStateProperty.all(AppColors.mainDarkColor),
      todayForegroundColor: WidgetStateProperty.all(AppColors.whiteColor),
      todayBorder: const BorderSide(color: AppColors.mainLightColor),
      yearForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.whiteColor;
        }
        return AppColors.mainDarkColor;
      }),
      yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.mainLightColor;
        }
        return Colors.transparent;
      }),
      rangePickerBackgroundColor: AppColors.whiteColor,
      rangeSelectionBackgroundColor: AppColors.mainLightColor.withValues(
        alpha: .15,
      ),
      rangeSelectionOverlayColor: const WidgetStatePropertyAll(
        Colors.transparent,
      ),
      cancelButtonStyle: TextButton.styleFrom(foregroundColor: Colors.red),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.mainLightColor,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    scaffoldBackgroundColor: AppColors.lightBgColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.mainLightColor,
      unselectedItemColor: AppColors.lightGreyColor,
      selectedLabelStyle: AppStyles.regular12MainLightColor,
      unselectedLabelStyle: AppStyles.regular12GreyColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainLightColor,
      shape: StadiumBorder(),
    ),
    cardColor: AppColors.mainLightColor,
    canvasColor: AppColors.whiteColor,
    dividerColor: AppColors.strokeWhiteColor,
    disabledColor: AppColors.strokeWhiteColor,
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
      displayMedium: AppStyles.regular14Grey,
      displayLarge: AppStyles.medium18MainLightColor,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomPageTransitionsBuilder(),
        TargetPlatform.iOS: CustomPageTransitionsBuilder(),
      },
    ),

    timePickerTheme: TimePickerThemeData(
      dialTextColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.whiteColor;
        }
        return AppColors.mainDarkColor;
      }),
      backgroundColor: AppColors.darkBgColor,
      hourMinuteColor: AppColors.mainLightColor,
      hourMinuteTextColor: AppColors.whiteColor,
      dayPeriodColor: AppColors.mainLightColor,
      dayPeriodTextColor: AppColors.whiteColor,
      dialBackgroundColor: AppColors.mainLightColor.withValues(alpha: .15),
      dialHandColor: AppColors.mainLightColor,
      entryModeIconColor: AppColors.whiteColor,
      cancelButtonStyle: TextButton.styleFrom(foregroundColor: Colors.red),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.mainLightColor,
      ),
      helpTextStyle: const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      hourMinuteTextStyle: const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      dayPeriodTextStyle: const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    datePickerTheme: DatePickerThemeData(
      subHeaderForegroundColor: AppColors.whiteColor,
      backgroundColor: AppColors.darkBgColor,
      weekdayStyle: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w600,
      ),
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.mainLightColor;
        }
        return Colors.transparent;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.whiteColor;
        }
        return AppColors.mainDarkColor;
      }),
      rangeSelectionOverlayColor: WidgetStatePropertyAll(
        AppColors.transparentColor,
      ),
      rangePickerBackgroundColor: AppColors.whiteColor,
      todayBackgroundColor: WidgetStateProperty.all(AppColors.mainLightColor),
      todayForegroundColor: WidgetStateProperty.all(AppColors.whiteColor),
      todayBorder: const BorderSide(color: AppColors.whiteColor),
      headerBackgroundColor: AppColors.mainLightColor,
      headerForegroundColor: AppColors.whiteColor,
      rangeSelectionBackgroundColor: AppColors.whiteColor,
      yearForegroundColor: WidgetStateProperty.all(AppColors.mainDarkColor),
      cancelButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.red),
      ),
      confirmButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.mainDarkColor),
      ),
    ),
    scaffoldBackgroundColor: AppColors.darkBgColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBgColor,
      selectedItemColor: AppColors.mainDarkColor,
      unselectedItemColor: AppColors.lightGreyColor,
      selectedLabelStyle: AppStyles.regular12MainDarkColor,
      unselectedLabelStyle: AppStyles.regular12GreyColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainDarkColor,
      shape: StadiumBorder(),
    ),
    cardColor: AppColors.mainDarkColor,
    canvasColor: AppColors.inputDarkColor,
    dividerColor: AppColors.mainLightColor,
    disabledColor: AppColors.strokeDarkColor,
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
      displayMedium: AppStyles.regular14WhiteDarkColor,
      displayLarge: AppStyles.medium18MainDarkColor,
    ),
  );
}
