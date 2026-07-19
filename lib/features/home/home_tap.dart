import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  int selectedLang = 0;
  int selectedMode = 0;
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: Text(
          AppLocalizations.of(context)!.language,
          style: AppStyles.semi20White,
        ),
      ),
      body: Column(
        spacing: 10,
        children: [
          const SizedBox(height: 100),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Row(
            spacing: 10,
            mainAxisAlignment: .center,
            children: [
              buildSwitchContainer(
                isIcon: false,
                text: AppLocalizations.of(context)!.english,
                isSelected: selectedLang == 0,
                onTap: () {
                  selectedLang = 0;
                  languageProvider.changeLanguage('en');
                },
              ),
              buildSwitchContainer(
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
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Row(
            spacing: 10,
            mainAxisAlignment: .center,
            children: [
              buildSwitchContainer(
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
              buildSwitchContainer(
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
        ],
      ),
    );
  }

  Widget buildSwitchContainer({
    required VoidCallback onTap,
    required bool isSelected,
    String? text,
    IconData? child,
    required bool isIcon,
  }) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isIcon ? 20 : 35,
          vertical: isIcon ? 10 : 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected
              ? Theme.of(context).cardColor
              : Theme.of(context).canvasColor,
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: isIcon
            ? Icon(
                child,
                color: isSelected
                    ? AppColors.whiteColor
                    : themeProvider.isDark
                    ? AppColors.whiteColor
                    : AppColors.mainLightColor,
              )
            : Text(
                text!,
                style: isSelected
                    ? AppStyles.semi14White
                    : Theme.of(context).textTheme.titleLarge,
              ),
      ),
    );
  }
}
