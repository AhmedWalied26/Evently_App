// ignore_for_file: use_build_context_synchronously
import 'package:evently_app/features/home/add_event/widgets/custom_appbar.dart';
import 'package:evently_app/features/home/add_event/widgets/date_time_item.dart';
import 'package:evently_app/features/home/taps/home_tap/widgets/custom_tab_bar.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/model/event_model.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_validation.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:evently_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UpdateEventView extends StatefulWidget {
  const UpdateEventView({super.key});

  @override
  State<UpdateEventView> createState() => _UpdateEventViewState();
}

class _UpdateEventViewState extends State<UpdateEventView> {
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
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String selectedEventName = '';
  String selectedEventImage = '';
  String formatDate = '';
  String formatTime = '';

  late TextEditingController controllerTitle;
  late TextEditingController controllerDescription;
  late EventModel args;
  bool initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!initialized) {
      args = ModalRoute.of(context)!.settings.arguments as EventModel;
      controllerTitle = TextEditingController(text: args.eventTitle);
      controllerDescription = TextEditingController(
        text: args.eventDescription,
      );
      selectedTab = args.eventCategoryIndex - 1;
      selectedDate = args.eventDate;
      initialized = true;
    }
  }

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
      appBar: CustomAppbar(title: AppLocalizations.of(context)!.edit_event),
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
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,
                    child: Image.asset(
                      themeProvider.isDark
                          ? darkImagesList[selectedTab]
                          : lightImagesList[selectedTab],
                      key: ValueKey(
                        themeProvider.isDark
                            ? darkImagesList[selectedTab]
                            : lightImagesList[selectedTab],
                      ),
                      height: height * 0.22,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
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
              CustomTextField(
                controller: controllerTitle,
                validation: (value) {
                  return AppValidation.validateEventTitle(value);
                },
                title: controllerTitle.text,
              ),
              SizedBox(height: height * 0.02),
              Text(
                AppLocalizations.of(context)!.description,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: height * 0.01),
              CustomTextField(
                maxLines: 6,
                controller: controllerDescription,
                validation: (value) {
                  return AppValidation.validateEventTitle(value);
                },
                title: controllerDescription.text,
              ),
              SizedBox(height: height * 0.02),
              DateTimeItem(
                title: AppLocalizations.of(context)!.eventDate,
                titleUnderline: formatDate == ''
                    ? DateFormat('dd MMM, yyyy').format(args.eventDate)
                    : formatDate,
                imageIcon: AppAssets.eventDateLightIcon,
                onTap: onChangeDate,
              ),
              DateTimeItem(
                onTap: onChangeTime,
                title: AppLocalizations.of(context)!.eventTime,
                titleUnderline: formatTime == ''
                    ? DateFormat('HH:mm a').format(args.eventDate)
                    : formatTime,
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
          isLoading: isLoading,
          title: AppLocalizations.of(context)!.update_event,
          onTap: () async {
            setState(() {
              isLoading = true;
            });
            DateTime finalDateTime = DateTime(
              (selectedDate ?? args.eventDate).year,
              (selectedDate ?? args.eventDate).month,
              (selectedDate ?? args.eventDate).day,
              selectedTime?.hour ?? args.eventDate.hour,
              selectedTime?.minute ?? args.eventDate.minute,
            );
            final updatedEvent = EventModel(
              eventId: args.eventId,
              eventLightImage: lightImagesList[selectedTab],
              eventDarkImage: darkImagesList[selectedTab],
              eventName: eventNameList[selectedTab],
              eventTitle: controllerTitle.text,
              eventDescription: controllerDescription.text,
              eventCategoryIndex: selectedTab + 1,
              eventDate: finalDateTime,
            );
            await updateEvent(updatedEvent);
            setState(() {
              isLoading = false;
            });
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.homeRouteName,
              (route) => false,
            );
          },
        ),
      ),
    );
  }

  bool isLoading = false;

  Future<void> updateEvent(EventModel event) async {
    await FirebaseUtils.editEvent(event);
  }

  void onChangeDate() async {
    FocusManager.instance.primaryFocus?.unfocus();
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chooseDate != null) {
      selectedDate = chooseDate;
      formatDate = DateFormat('dd/MM/yyyy').format(selectedDate!);
      setState(() {});
    }
  }

  void onChangeTime() async {
    FocusManager.instance.primaryFocus?.unfocus();
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (chooseTime != null) {
      selectedTime = chooseTime;
      formatTime = chooseTime.format(context);
      setState(() {});
    }
  }
}
