import 'package:evently_app/model/event_model.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/event_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var eventProvider = Provider.of<EventProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.eventDetailsRouteName,
          arguments: EventModel(
            eventLightImage: event.eventLightImage,
            eventDarkImage: event.eventDarkImage,
            eventName: event.eventName,
            eventTitle: event.eventTitle,
            eventDescription: event.eventDescription,
            eventCategoryIndex: event.eventCategoryIndex,
            eventDate: event.eventDate,
          ),
        );
      },
      child: Container(
        height: height * 0.193,
        width: .infinity,
        decoration: BoxDecoration(
          borderRadius: .circular(16),
          image: DecorationImage(
            fit: .fill,
            image: AssetImage(
              themeProvider.isDark
                  ? event.eventDarkImage
                  : event.eventLightImage,
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
                child: Text(
                  DateFormat('dd MMM').format(event.eventDate).toString(),
                ),
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
                    Text(event.eventTitle),
                    InkWell(
                      onTap: () async {
                        eventProvider.updateFavorite(event);
                      },
                      child: SvgPicture.asset(
                        event.isFavourite
                            ? AppAssets.favoriteFillLightIcon
                            : AppAssets.favoriteIcon,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).cardColor,
                          .srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
