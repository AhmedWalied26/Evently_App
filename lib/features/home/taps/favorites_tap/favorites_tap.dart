import 'package:evently_app/features/home/taps/home_tap/widgets/event_card.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/event_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class FavoritesTap extends StatefulWidget {
  const FavoritesTap({super.key});

  @override
  State<FavoritesTap> createState() => _FavoritesTapState();
}

class _FavoritesTapState extends State<FavoritesTap> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EventProvider>().getFavoriteEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var favProvider = Provider.of<EventProvider>(context);
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
              child: favProvider.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).cardColor,
                      ),
                    )
                  : favProvider.eventList.isEmpty
                  ? Text('data')
                  : ListView.separated(
                      itemCount: favProvider.eventFavList.length,
                      itemBuilder: (_, index) =>
                          EventCard(event: favProvider.eventFavList[index]),
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
