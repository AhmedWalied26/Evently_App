import 'package:evently_app/features/onboarding/widgets/skip_button.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.currentPage,
    required this.onArrowBack,
    required this.onSkip,
  });
  final int currentPage;
  final VoidCallback onArrowBack;
  final VoidCallback onSkip;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var args = ModalRoute.of(context)!.settings.arguments as Widget;
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: Visibility(
        visible: currentPage != 0,
        child: Row(
          children: [
            SizedBox(width: width * 0.035),
            SkipButton(onTap: onArrowBack, hasIcon: true),
          ],
        ),
      ),
      title: args,
      actions: [
        Visibility(
          visible: currentPage != 2,
          child: SkipButton(onTap: onSkip),
        ),
        SizedBox(width: width * 0.035),
      ],
    );
  }
}
