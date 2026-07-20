import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchMode extends StatelessWidget {
  const SwitchMode({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Transform.translate(
      offset: Offset(
        Directionality.of(context) == TextDirection.ltr ? 8 : -8,
        0,
      ),
      child: Switch(
        value: themeProvider.appTheme == ThemeMode.dark,
        onChanged: (value) {
          themeProvider.changeTheme(value ? .dark : .light);
        },
        thumbColor: WidgetStateProperty.resolveWith((states) {
          return AppColors.whiteColor;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return themeProvider.isDark
                ? AppColors.mainDarkColor
                : AppColors.mainLightColor;
          }
          return themeProvider.isDark
              ? AppColors.lightGreyColor
              : AppColors.grey200Color;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          return AppColors.transparentColor;
        }),
        trackOutlineWidth: WidgetStateProperty.all(1),
      ),
    );
  }
}
