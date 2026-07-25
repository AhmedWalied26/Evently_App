import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DateTimeItem extends StatelessWidget {
  final String title;
  final String titleUnderline;
  final String imageIcon;
  final VoidCallback onTap;
  const DateTimeItem({
    super.key,
    required this.title,
    required this.imageIcon,
    required this.titleUnderline,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Row(
      spacing: width * 0.02,
      children: [
        SvgPicture.asset(
          imageIcon,
          colorFilter: ColorFilter.mode(Theme.of(context).cardColor, .srcIn),
        ),
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        Spacer(),
        TextButton(
          onPressed: onTap,
          child: Text(
            titleUnderline,
            style:
                (themeProvider.isDark
                        ? AppStyles.regular14MainDarkColor
                        : AppStyles.regular14MainLightColor)
                    .copyWith(
                      decoration: .underline,
                      decorationColor: Theme.of(context).cardColor,
                    ),
          ),
        ),
      ],
    );
  }
}
