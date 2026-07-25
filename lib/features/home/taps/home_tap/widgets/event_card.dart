import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      height: height * 0.193,
      width: .infinity,
      decoration: BoxDecoration(
        borderRadius: .circular(16),
        image: DecorationImage(
          fit: .fill,
          image: AssetImage(
            themeProvider.isDark
                ? AppAssets.birthdayDarkImage
                : AppAssets.birthdayLightImage,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(width * 0.018),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .spaceBetween,
          children: [
            Container(
              padding: .all(width * 0.018),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: .circular(8),
                border: .all(color: Theme.of(context).dividerColor),
              ),
              child: Text(AppLocalizations.of(context)!.jun),
            ),
            Container(
              padding: .all(width * 0.018),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: .circular(8),
                border: .all(color: Theme.of(context).dividerColor),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.birthdayParty),
                  SvgPicture.asset(
                    AppAssets.favoriteIcon,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).cardColor,
                      .srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
