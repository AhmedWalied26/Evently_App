// ignore_for_file: use_build_context_synchronously
import 'package:evently_app/features/home/add_event/widgets/custom_appbar.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/model/event_model.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventDeatilsView extends StatefulWidget {
  const EventDeatilsView({super.key});

  @override
  State<EventDeatilsView> createState() => _EventDeatilsViewState();
}

class _EventDeatilsViewState extends State<EventDeatilsView> {
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var args = ModalRoute.of(context)!.settings.arguments as EventModel;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: CustomAppbar(
        onEditClick: () {
          Navigator.pushNamed(
            context,
            AppRoutes.updateEventRouteName,
            arguments: EventModel(
              eventLightImage: args.eventLightImage,
              eventDarkImage: args.eventDarkImage,
              eventName: args.eventName,
              eventTitle: args.eventTitle,
              eventDescription: args.eventDescription,
              eventCategoryIndex: args.eventCategoryIndex,
              eventDate: args.eventDate,
            ),
          );
        },
        title: 'Event details',
        hasIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.035),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              SizedBox(height: height * 0.01),
              Container(
                width: .infinity,
                decoration: BoxDecoration(
                  borderRadius: .circular(16),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    themeProvider.isDark
                        ? args.eventDarkImage
                        : args.eventLightImage,
                    height: height * 0.22,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: height * 0.016),
              Text(
                args.eventTitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: height * 0.016),
              Container(
                padding: .all(width * 0.035),
                decoration: BoxDecoration(
                  borderRadius: .circular(16),
                  color: Theme.of(context).canvasColor,
                  border: .all(color: Theme.of(context).disabledColor),
                ),
                child: Row(
                  spacing: width * 0.035,
                  children: [
                    Container(
                      padding: .all(height * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: .circular(8),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        border: .all(color: Theme.of(context).disabledColor),
                      ),
                      child: SvgPicture.asset(
                        themeProvider.isDark
                            ? AppAssets.eventDateDarkIcon
                            : AppAssets.eventDateLightIcon,
                      ),
                    ),
                    Column(
                      spacing: height * 0.003,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          DateFormat('yy MMMM').format(args.eventDate),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          DateFormat('HH:mm a').format(args.eventDate),
                          style: AppStyles.medium16LightGreyColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.016),
              Text(
                AppLocalizations.of(context)!.description,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: height * 0.01),
              Container(
                padding: .all(width * 0.035),
                decoration: BoxDecoration(
                  borderRadius: .circular(16),
                  color: Theme.of(context).canvasColor,
                  border: .all(color: Theme.of(context).disabledColor),
                ),
                child: Text(
                  args.eventDescription,
                  style: themeProvider.isDark
                      ? AppStyles.regular14WhiteDarkColor.copyWith(height: 1.8)
                      : AppStyles.regular14BlackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
