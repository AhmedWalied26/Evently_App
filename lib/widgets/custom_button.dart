import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: .all(height * 0.012),
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: .circular(16)),
      ),
      onPressed: onTap,
      child: Text(title, style: AppStyles.medium20White),
    );
  }
}
