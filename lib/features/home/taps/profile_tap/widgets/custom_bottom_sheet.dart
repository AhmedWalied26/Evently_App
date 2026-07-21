import 'package:evently_app/features/home/taps/profile_tap/widgets/setting_tile.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.all(width * 0.04),
      child: Column(
        mainAxisSize: .min,
        children: [
          Container(
            height: 6,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: .circular(100),
              color: themeProvider.isDark
                  ? AppColors.grey200Color
                  : AppColors.disableColor,
            ),
          ),
          SizedBox(height: height * 0.02),
          Text(
            AppLocalizations.of(context)!.chooseLanguage,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            AppLocalizations.of(context)!.selectPreferredLanguage,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: height * 0.03),
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('en');
              Navigator.pop(context);
            },
            overlayColor: WidgetStateProperty.all(AppColors.transparentColor),
            child: SettingTile(
              horiMargin: 0,
              title: AppLocalizations.of(context)!.english,
              child: Visibility(
                visible: languageProvider.appLanguage == 'en',
                child: Icon(
                  Icons.check,
                  color: themeProvider.isDark
                      ? AppColors.mainDarkColor
                      : AppColors.mainLightColor,
                  size: 26,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('ar');
              Navigator.pop(context);
            },
            overlayColor: WidgetStateProperty.all(AppColors.transparentColor),
            child: SettingTile(
              horiMargin: 0,
              title: AppLocalizations.of(context)!.arabic,
              child: Visibility(
                visible: languageProvider.appLanguage == 'ar',
                child: Icon(
                  Icons.check,
                  color: themeProvider.isDark
                      ? AppColors.mainDarkColor
                      : AppColors.mainLightColor,
                  size: 26,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
        ],
      ),
    );
  }
}
