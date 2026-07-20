import 'package:evently_app/features/onboarding/widgets/custom_appbar.dart';
import 'package:evently_app/features/onboarding/widgets/page_item.dart';
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
                      title: 'Find Events That Inspire You',
                      subTitle:
                          'Dive into a world of events crafted to fit your unique interests. Whether you`re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
                      pageController: pageController,
                    ),
                    PageItem(
                      imageLight: AppAssets.onBoardingLightImage3,
                      imageDark: AppAssets.onBoardingDarkImage3,
                      title: 'Effortless Event Planning',
                      subTitle:
                          'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
                      pageController: pageController,
                    ),
                    PageItem(
                      imageLight: AppAssets.onBoardingLightImage4,
                      imageDark: AppAssets.onBoardingDarkImage4,
                      title: 'Connect with Friends & Share Moments',
                      subTitle:
                          'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
                      pageController: pageController,
                    ),
                  ],
                ),
              ),
              CustomButton(
                title: currentPage != 2 ? 'Next' : 'Get Strated',
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
