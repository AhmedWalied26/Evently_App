import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.child,
    this.hasIcon = false,
    this.isLoading = false,
  });
  final String title;
  final VoidCallback onTap;
  final Widget? child;
  final bool hasIcon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        overlayColor: AppColors.transparentColor,
        padding: .all(height * 0.015),
        backgroundColor: hasIcon
            ? Theme.of(context).canvasColor
            : Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: .circular(16)),
        side: BorderSide(color: Theme.of(context).disabledColor),
      ),
      onPressed: onTap,
      child: Row(
        spacing: hasIcon ? width * 0.04 : 0,
        mainAxisAlignment: .center,
        children: [
          child ?? SizedBox(),
          isLoading
              ? SizedBox(
                  height: 29,
                  width: 29,
                  child: CircularProgressIndicator(color: AppColors.whiteColor),
                )
              : Text(
                  title,
                  style: hasIcon
                      ? Theme.of(context).textTheme.displayLarge
                      : AppStyles.medium20White,
                ),
        ],
      ),
    );
  }
}
