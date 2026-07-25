import 'package:evently_app/features/home/taps/home_tap/widgets/custom_tab_bar.dart';
import 'package:evently_app/features/home/taps/home_tap/widgets/event_card.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
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
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcomeBack,
                        style: AppStyles.regular14Grey,
                      ),
                      Text(
                        'Ahmed Walied',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
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
                onTap: (index) {
                  selectedTap = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: AppColors.transparentColor,
                dividerColor: AppColors.transparentColor,
                labelPadding: .zero,
                tabAlignment: .start,
                tabs: eventNameList.map((eventName) {
                  return CustomTabBar(
                    isSelected: selectedTap == eventNameList.indexOf(eventName),
                    eventName: eventName,
                  );
                }).toList(),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (_, index) =>
                      SizedBox(height: height * 0.016),
                  itemBuilder: (_, index) => EventCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
