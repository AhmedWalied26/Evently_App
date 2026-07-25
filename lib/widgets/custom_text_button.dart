import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomTextButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(overlayColor: AppColors.transparentColor),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          decoration: .underline,
          decorationThickness: 2,
          decorationColor: Theme.of(context).cardColor,
        ),
      ),
    );
  }
}
