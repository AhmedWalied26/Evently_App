import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final Widget child;
  const SettingTile({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      decoration: BoxDecoration(
        borderRadius: .circular(16),
        border: .all(color: Theme.of(context).disabledColor),
        color: Theme.of(context).canvasColor,
      ),
      child: ListTile(
        title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
        trailing: child,
      ),
    );
  }
}
