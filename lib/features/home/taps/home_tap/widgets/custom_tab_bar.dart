import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final bool isSelected;
  final String eventName;
  final IconData? icon;

  const CustomTabBar({
    super.key,
    this.isSelected = false,
    required this.eventName,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Row(
      children: [
        Container(
          padding: .symmetric(
            horizontal: width * 0.036,
            vertical: height * 0.01,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).cardColor
                : Theme.of(context).canvasColor,
            borderRadius: .circular(20),
            border: Border.all(width: 2, color: Theme.of(context).dividerColor),
          ),

          child: Row(
            spacing: width * 0.018,
            children: [
              Icon(
                icon,
                color: isSelected
                    ? AppColors.whiteColor
                    : Theme.of(context).cardColor,
              ),
              Text(
                eventName,
                style: isSelected
                    ? AppStyles.medium16White
                    : Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        SizedBox(width: width * 0.02),
      ],
    );
  }
}
