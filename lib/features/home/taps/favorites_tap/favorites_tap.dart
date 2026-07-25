import 'package:evently_app/features/home/taps/home_tap/widgets/event_card.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritesTap extends StatelessWidget {
  const FavoritesTap({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.035,
          vertical: height * 0.02,
        ),
        child: Column(
          spacing: height * 0.016,
          children: [
            CustomTextField(
              title: AppLocalizations.of(context)!.searchForEvent,
              suffix: Padding(
                padding: EdgeInsetsDirectional.only(end: width * 0.035),
                child: SvgPicture.asset(AppAssets.searchIcon),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (_, index) => EventCard(),
                separatorBuilder: (_, index) =>
                    SizedBox(height: height * 0.016),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
