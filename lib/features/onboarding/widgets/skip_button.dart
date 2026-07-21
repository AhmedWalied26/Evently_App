import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, this.hasIcon = false, required this.onTap});
  final bool hasIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return InkWell(
      overlayColor: WidgetStateProperty.all(AppColors.transparentColor),
      onTap: onTap,
      child: Container(
        alignment: hasIcon
            ? languageProvider.appLanguage == 'ar'
                  ? .centerLeft
                  : .centerRight
            : .center,
        height: height * 0.034,
        width: hasIcon ? width * 0.08 : width * 0.14,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(8),
          border: .all(color: Theme.of(context).dividerColor),
        ),
        child: hasIcon
            ? Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: themeProvider.isDark
                    ? AppColors.whiteColor
                    : AppColors.mainLightColor,
              )
            : Text(
                AppLocalizations.of(context)!.skip,
                style: Theme.of(context).textTheme.displaySmall,
              ),
      ),
    );
  }
}
