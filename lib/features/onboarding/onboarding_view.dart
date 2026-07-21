import 'package:evently_app/features/onboarding/widgets/custom_appbar.dart';
import 'package:evently_app/features/onboarding/widgets/page_item.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentPage = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
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
                child: PageView(
                  onPageChanged: (index) {
                    currentPage = index;
                    setState(() {});
                  },
                  controller: pageController,
                  children: [
                    PageItem(
                      imageLight: AppAssets.onBoardingLightImage2,
                      imageDark: AppAssets.onBoardingDarkImage2,
                      title: AppLocalizations.of(context)!.findEventsTitle,
                      subTitle: AppLocalizations.of(
                        context,
                      )!.findEventsDescription,
                      pageController: pageController,
                    ),
                    PageItem(
                      imageLight: AppAssets.onBoardingLightImage3,
                      imageDark: AppAssets.onBoardingDarkImage3,
                      title: AppLocalizations.of(context)!.eventPlanningTitle,
                      subTitle: AppLocalizations.of(
                        context,
                      )!.eventPlanningDescription,
                      pageController: pageController,
                    ),
                    PageItem(
                      imageLight: AppAssets.onBoardingLightImage4,
                      imageDark: AppAssets.onBoardingDarkImage4,
                      title: AppLocalizations.of(
                        context,
                      )!.connectWithFriendsTitle,
                      subTitle: AppLocalizations.of(
                        context,
                      )!.connectWithFriendsDescription,
                      pageController: pageController,
                    ),
                  ],
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
