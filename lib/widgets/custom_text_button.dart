import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomTextButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
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
