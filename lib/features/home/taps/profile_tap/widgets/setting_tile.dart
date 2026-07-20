import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final Widget child;
  final double horiMargin;

  const SettingTile({
    super.key,
    required this.title,
    required this.child,
    required this.horiMargin,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Container(
      height: height * 0.06,
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      margin: .symmetric(horizontal: horiMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).disabledColor),
        color: Theme.of(context).canvasColor,
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          child,
        ],
      ),
    );
  }
}
