import 'package:evently_app/features/onboarding/widgets/custom_switch.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomizeView extends StatelessWidget {
  const CustomizeView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.035,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Image.asset(
                themeProvider.isDark
                    ? AppAssets.eventlyLogoDarkImage
                    : AppAssets.eventlyLogoLightImage,
                height: 27,
              ),
              SizedBox(height: height * 0.03),
              Image.asset(
                themeProvider.isDark
                    ? AppAssets.onBoardingDarkImage1
                    : AppAssets.onBoardingLightImage1,
                height: height * 0.43,
                fit: .contain,
              ),
              SizedBox(height: height * 0.04),
              Text(
                'Personalize Your Experience',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: height * 0.03),
              Row(
                spacing: width * 0.02,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Spacer(),
                  CustomSwitch(
                    isIcon: false,
                    text: AppLocalizations.of(context)!.english,
                    isSelected: languageProvider.appLanguage == 'en',
                    onTap: () {
                      languageProvider.changeLanguage('en');
                    },
                  ),
                  CustomSwitch(
                    isIcon: false,
                    text: AppLocalizations.of(context)!.arabic,
                    isSelected: languageProvider.appLanguage == 'ar',
                    onTap: () {
                      languageProvider.changeLanguage('ar');
                    },
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Row(
                spacing: width * 0.02,
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Spacer(),
                  CustomSwitch(
                    isIcon: true,
                    child: !themeProvider.isDark
                        ? Icons.light_mode
                        : Icons.light_mode_outlined,
                    isSelected: !themeProvider.isDark,
                    onTap: () {
                      themeProvider.changeTheme(.light);
                    },
                  ),
                  CustomSwitch(
                    isIcon: true,
                    child: themeProvider.isDark
                        ? Icons.dark_mode
                        : Icons.dark_mode_outlined,
                    isSelected: themeProvider.isDark,
                    onTap: () {
                      themeProvider.changeTheme(.dark);
                    },
                  ),
                ],
              ),
              Spacer(),
              CustomButton(
                title: 'Let’s start',
                onTap: () {
                  Navigator.pushNamed(
                    arguments: Image.asset(
                      themeProvider.isDark
                          ? AppAssets.eventlyLogoDarkImage
                          : AppAssets.eventlyLogoLightImage,
                      height: 27,
                    ),
                    context,
                    AppRoutes.onboardingRouteName,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
