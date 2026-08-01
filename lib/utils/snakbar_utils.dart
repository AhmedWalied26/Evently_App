import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SnakbarUtils {
  static SnackBar snackBar({
    required String title,
    required BuildContext context,
    bool isError = false,
  }) {
    return SnackBar(
      padding: const .all(16),
      content: Row(
        spacing: 10,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.whiteColor,
            radius: 16,
            child: Icon(
              color: isError ? AppColors.redColor : AppColors.greenColor,
              isError ? Icons.error : Icons.check,
            ),
          ),
          Expanded(child: Text(title, style: AppStyles.medium18White)),
        ],
      ),
      backgroundColor: isError ? AppColors.redColor : AppColors.greenColor,
      behavior: .floating,
      shape: RoundedRectangleBorder(borderRadius: .circular(16)),
    );
  }
}
