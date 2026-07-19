import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSwitch extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String? text;
  final IconData? child;
  final bool isIcon;
  const CustomSwitch({
    super.key,
    required this.onTap,
    required this.isSelected,
    this.text,
    this.child,
    required this.isIcon,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isIcon ? width * 0.035 : width * 0.035,
          vertical: isIcon ? height * 0.004 : height * 0.006,
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
