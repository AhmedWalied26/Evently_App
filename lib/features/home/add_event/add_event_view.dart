import 'package:evently_app/features/home/add_event/widgets/custom_appbar.dart';
import 'package:evently_app/features/home/add_event/widgets/date_time_item.dart';
import 'package:evently_app/features/home/taps/home_tap/widgets/custom_tab_bar.dart';
import 'package:evently_app/features/onboarding/widgets/skip_button.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:evently_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEventView extends StatefulWidget {
  const AddEventView({super.key});

  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  List<IconData> iconsTabs = [
    Icons.directions_bike,
    Icons.cake_outlined,
    Icons.diversity_3,
    Icons.menu_book_sharp,
    Icons.museum,
  ];
  List<String> lightImagesList = [
    AppAssets.sportLightImage,
    AppAssets.birthdayLightImage,
    AppAssets.meetingLightImage,
    AppAssets.bookClubLightImage,
    AppAssets.exhibitionLightImage,
  ];
  List<String> darkImagesList = [
    AppAssets.sportDarkImage,
    AppAssets.birthdayDarkImage,
    AppAssets.meetingDarkImage,
    AppAssets.bookClubDarkImage,
    AppAssets.exhibitionDarkImage,
  ];

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    List<String> eventNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
    ];
    return Scaffold(
      appBar: CustomAppbar(),
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
                  borderRadius: .circular(16),
                  child: Image.asset(
                    height: height * 0.22,
                    themeProvider.isDark
                        ? darkImagesList[selectedTab]
                        : lightImagesList[selectedTab],
                    fit: .fill,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
                child: ListView.separated(
                  scrollDirection: .horizontal,
                  itemCount: eventNameList.length,
                  separatorBuilder: (context, index) => SizedBox(),
                  itemBuilder: (context, index) => InkWell(
                    overlayColor: WidgetStateProperty.all(
                      AppColors.transparentColor,
                    ),
                    onTap: () {
                      selectedTab = index;
                      setState(() {});
                    },
                    child: CustomTabBar(
                      icon: iconsTabs[index],
                      isSelected: selectedTab == index,
                      eventName: eventNameList[index],
                    ),
                  ),
                ),
              ),
              Text(
                AppLocalizations.of(context)!.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: height * 0.01),
              CustomTextField(title: AppLocalizations.of(context)!.eventTitle),
              SizedBox(height: height * 0.02),
              Text(
                AppLocalizations.of(context)!.description,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: height * 0.01),
              CustomTextField(
                maxLines: 6,
                title: AppLocalizations.of(context)!.eventDescription,
              ),
              SizedBox(height: height * 0.02),
              DateTimeItem(
                title: AppLocalizations.of(context)!.eventDate,
                titleUnderline: AppLocalizations.of(context)!.chooseDate,
                imageIcon: AppAssets.eventDateLightIcon,
                onTap: () {},
              ),
              DateTimeItem(
                onTap: () {},
                title: AppLocalizations.of(context)!.eventTime,
                titleUnderline: AppLocalizations.of(context)!.chooseTime,
                imageIcon: AppAssets.eventTimeLightIcon,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.035,
          vertical: height * 0.03,
        ),
        child: CustomButton(
          title: AppLocalizations.of(context)!.addEvent,
          onTap: () {},
        ),
      ),
    );
  }
}
