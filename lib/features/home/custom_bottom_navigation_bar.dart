import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onTap;
  final int currentIndex;
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      clipBehavior: .antiAlias,
      height: height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: .circular(24),
          topRight: .circular(24),
        ),
      ),
      child: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.homeIcon),
            label: 'Home',
            activeIcon: SvgPicture.asset(
              themeProvider.isDark
                  ? AppAssets.homeFillDarkIcon
                  : AppAssets.homeFillLightIcon,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.favoriteIcon),
            label: 'Favorite',
            activeIcon: SvgPicture.asset(
              themeProvider.isDark
                  ? AppAssets.favoriteFillDarkIcon
                  : AppAssets.favoriteFillLightIcon,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.profileIcon),
            label: 'Profile',
            activeIcon: SvgPicture.asset(
              themeProvider.isDark
                  ? AppAssets.profileFillDarkIcon
                  : AppAssets.profileFillLightIcon,
            ),
          ),
        ],
      ),
    );
  }
}
