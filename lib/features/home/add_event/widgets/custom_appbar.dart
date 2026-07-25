import 'package:evently_app/features/onboarding/widgets/skip_button.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return AppBar(
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        AppLocalizations.of(context)!.addEvent,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      leading: Padding(
        padding: EdgeInsetsDirectional.only(
          start: width * 0.036,
          top: height * 0.01,
          bottom: height * 0.01,
        ),
        child: SkipButton(
          onTap: () {
            Navigator.pop(context);
          },
          hasIcon: true,
        ),
      ),
    );
  }
}
