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

class CustomizeView extends StatefulWidget {
  const CustomizeView({super.key});

  @override
  State<CustomizeView> createState() => _CustomizeViewState();
}

class _CustomizeViewState extends State<CustomizeView> {
  int selectedLang = 0;

  int selectedMode = 0;

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
              Image.asset(
                themeProvider.isDark
                    ? AppAssets.onBoardingDarkImage1
                    : AppAssets.onBoardingLightImage1,
              ),
              Text(
                'Personalize Your Experience',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: height * 0.01),
              Text(
                'Choose your preferred theme and\nlanguage to get started with a\ncomfortable, tailored experience that suits\nyour style.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: height * 0.016),
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
                    isSelected: selectedLang == 0,
                    onTap: () {
                      selectedLang = 0;
                      languageProvider.changeLanguage('en');
                    },
                  ),
                  CustomSwitch(
                    isIcon: false,
                    text: AppLocalizations.of(context)!.arabic,
                    isSelected: selectedLang == 1,
                    onTap: () {
                      selectedLang = 1;
                      languageProvider.changeLanguage('ar');
                    },
                  ),
                ],
              ),
              SizedBox(height: height * 0.016),
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
                    child: selectedMode == 0
                        ? Icons.light_mode
                        : Icons.light_mode_outlined,
                    isSelected: selectedMode == 0,
                    onTap: () {
                      selectedMode = 0;
                      themeProvider.changeTheme(.light);
                      setState(() {});
                    },
                  ),
                  CustomSwitch(
                    isIcon: true,
                    child: selectedMode == 1
                        ? Icons.dark_mode
                        : Icons.dark_mode_outlined,
                    isSelected: selectedMode == 1,
                    onTap: () {
                      selectedMode = 1;
                      themeProvider.changeTheme(.dark);
                      setState(() {});
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
