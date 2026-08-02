import 'package:evently_app/features/onboarding/widgets/skip_button.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.hasIcon = false,
    this.onEditClick,
    this.onTrashClick,
  });

  final String title;
  final bool hasIcon;
  final VoidCallback? onEditClick;
  final VoidCallback? onTrashClick;

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
      title: Text(title, style: Theme.of(context).textTheme.titleSmall),
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
      actions: [
        Visibility(
          visible: hasIcon,
          child: InkWell(
            overlayColor: WidgetStatePropertyAll(AppColors.transparentColor),
            onTap: onEditClick,
            child: Container(
              padding: .all(width * 0.01),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(8),
                border: .all(color: Theme.of(context).dividerColor),
              ),
              child: SvgPicture.asset(AppAssets.editIcon),
            ),
          ),
        ),
        SizedBox(width: width * 0.016),
        Visibility(
          visible: hasIcon,
          child: InkWell(
            overlayColor: WidgetStatePropertyAll(AppColors.transparentColor),
            onTap: onTrashClick,
            child: Container(
              padding: .all(width * 0.01),
              margin: .directional(end: width * 0.035),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(8),
                border: .all(color: Theme.of(context).dividerColor),
              ),
              child: SvgPicture.asset(AppAssets.trashIcon),
            ),
          ),
        ),
      ],
    );
  }
}
