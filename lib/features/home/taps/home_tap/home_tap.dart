import 'package:evently_app/features/home/taps/home_tap/widgets/custom_tab_bar.dart';
import 'package:evently_app/features/home/taps/home_tap/widgets/event_card.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/event_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  int selectedTap = 0;
  List<IconData> iconsTabs = [
    Icons.grid_view_sharp,
    Icons.directions_bike,
    Icons.cake_outlined,
    Icons.diversity_3,
    Icons.menu_book_sharp,
    Icons.museum,
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EventProvider>().getAllEvents();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    var eventProvider = Provider.of<EventProvider>(context);

    List<String> eventNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
    ];
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.035,
          vertical: height * 0.02,
        ),
        child: DefaultTabController(
          length: eventNameList.length,
          child: Column(
            spacing: height * 0.024,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcomeBack,
                        style: AppStyles.regular14Grey,
                      ),
                      Text(
                        userProvider.userModel!.name,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    style: IconButton.styleFrom(
                      overlayColor: AppColors.transparentColor,
                    ),
                    onPressed: () {
                      themeProvider.changeThemeButton();
                    },
                    icon: Icon(
                      themeProvider.isDark
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                      color: Theme.of(context).cardColor,
                      size: 26,
                    ),
                  ),
                  InkWell(
                    overlayColor: WidgetStateProperty.all(
                      AppColors.transparentColor,
                    ),
                    onTap: () {
                      languageProvider.changeLanguageButton();
                    },
                    child: Container(
                      padding: .symmetric(
                        horizontal: width * 0.018,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: .circular(8),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Text(
                        languageProvider.appLanguage.toUpperCase(),
                        style: AppStyles.semi14White,
                      ),
                    ),
                  ),
                ],
              ),
              TabBar(
                overlayColor: WidgetStateProperty.all(
                  AppColors.transparentColor,
                ),
                onTap: (index) {
                  selectedTap = index;
                  setState(() {});
                  if (index == 0) {
                    eventProvider.getAllEvents();
                  } else {
                    eventProvider.getFilterEvents(index);
                  }
                },
                isScrollable: true,
                indicatorColor: AppColors.transparentColor,
                dividerColor: AppColors.transparentColor,
                labelPadding: .zero,
                tabAlignment: .start,
                tabs: List.generate(eventNameList.length, (index) {
                  return CustomTabBar(
                    icon: iconsTabs[index],
                    isSelected: selectedTap == index,
                    eventName: eventNameList[index],
                  );
                }),
              ),
              Expanded(
                child: eventProvider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).cardColor,
                        ),
                      )
                    : eventProvider.eventList.isEmpty
                    ? Center(
                        child: Text(AppLocalizations.of(context)!.no_events),
                      )
                    : ListView.separated(
                        itemCount: eventProvider.eventList.length,
                        separatorBuilder: (_, index) =>
                            SizedBox(height: height * 0.016),
                        itemBuilder: (_, index) =>
                            EventCard(event: eventProvider.eventList[index]),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
