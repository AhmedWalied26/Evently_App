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
  });
  final String title;
  final VoidCallback onTap;
  final Widget? child;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
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
          Text(
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
