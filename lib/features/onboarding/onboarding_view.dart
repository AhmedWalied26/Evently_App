import 'package:evently_app/features/onboarding/widgets/custom_appbar.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/model/onboarding_model.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentPage = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      currentPage = pageController.page!.toInt();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    List<OnboardingModel> onboardingList = [
      OnboardingModel(
        lightImage: AppAssets.onBoardingLightImage2,
        darkImage: AppAssets.onBoardingDarkImage2,
        title: AppLocalizations.of(context)!.findEventsTitle,
        description: AppLocalizations.of(context)!.findEventsDescription,
      ),
      OnboardingModel(
        lightImage: AppAssets.onBoardingLightImage3,
        darkImage: AppAssets.onBoardingDarkImage3,
        title: AppLocalizations.of(context)!.eventPlanningTitle,
        description: AppLocalizations.of(context)!.eventPlanningDescription,
      ),
      OnboardingModel(
        lightImage: AppAssets.onBoardingLightImage4,
        darkImage: AppAssets.onBoardingDarkImage4,
        title: AppLocalizations.of(context)!.connectWithFriendsTitle,
        description: AppLocalizations.of(
          context,
        )!.connectWithFriendsDescription,
      ),
    ];
    return Scaffold(
      appBar: CustomAppbar(
        onArrowBack: () {
          pageController.previousPage(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
          );
        },
        onSkip: () {
          pageController.animateToPage(
            2,
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
          );
        },
        currentPage: currentPage,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.045,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: .stretch,
            spacing: height * 0.024,
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: onboardingList.length,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(
                          themeProvider.isDark
                              ? onboardingList[index].darkImage
                              : onboardingList[index].lightImage,
                          height: height * 0.43,
                          fit: .contain,
                        ),
                        SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          onDotClicked: (index) {
                            pageController.animateToPage(
                              index,
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeInOut,
                            );
                          },
                          effect: ExpandingDotsEffect(
                            activeDotColor: Theme.of(context).cardColor,
                            dotColor: themeProvider.isDark
                                ? AppColors.lightBgColor
                                : AppColors.disableColor,
                            radius: 36,
                            dotHeight: 8,
                            dotWidth: 8,
                          ),
                        ),
                        SizedBox(height: height * 0.016),
                        Row(
                          children: [
                            Text(
                              onboardingList[index].title,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.015),
                        Text(
                          onboardingList[index].description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    );
                  },
                ),
              ),
              CustomButton(
                title: currentPage != 2
                    ? AppLocalizations.of(context)!.next
                    : AppLocalizations.of(context)!.getStarted,
                onTap: () {
                  currentPage == 2
                      ? Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.loginRouteName,
                          (route) => false,
                        )
                      : pageController.nextPage(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
