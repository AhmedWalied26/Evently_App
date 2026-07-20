import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageItem extends StatelessWidget {
  const PageItem({
    super.key,
    required this.imageLight,
    required this.imageDark,
    required this.title,
    required this.subTitle,
    required this.pageController,
  });
  final String imageLight;
  final String imageDark;
  final String title;
  final String subTitle;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Column(
      children: [
        Image.asset(
          themeProvider.isDark ? imageDark : imageLight,
          height: height * 0.43,
          fit: .contain,
        ),
        SizedBox(height: height * 0.008),
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
            Text(title, style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
        SizedBox(height: height * 0.015),
        Text(subTitle, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
