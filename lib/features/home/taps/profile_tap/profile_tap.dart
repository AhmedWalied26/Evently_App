import 'package:evently_app/features/home/taps/profile_tap/widgets/custom_bottom_sheet.dart';
import 'package:evently_app/features/home/taps/profile_tap/widgets/setting_tile.dart';
import 'package:evently_app/features/home/taps/profile_tap/widgets/switch_mode.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: height * 0.032),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(AppAssets.routeLogoImage),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Ahmed Walied',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: height * 0.01),
          Text(
            'ahmed.route@gmail.com',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: height * 0.042),
          SettingTile(
            horiMargin: width * 0.04,
            title: AppLocalizations.of(context)!.darkMode,
            child: SwitchMode(),
          ),
          SizedBox(height: height * 0.016),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                context: context,
                builder: (context) {
                  return CustomBottomSheet();
                },
              );
            },
            overlayColor: WidgetStateProperty.all(AppColors.transparentColor),
            child: SettingTile(
              horiMargin: width * 0.04,
              title: AppLocalizations.of(context)!.language,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          SizedBox(height: height * 0.016),
          SettingTile(
            horiMargin: width * 0.04,
            title: AppLocalizations.of(context)!.logout,
            child: SvgPicture.asset(
              AppAssets.logoutIcon,
              width: 26,
              height: 26,
            ),
          ),
        ],
      ),
    );
  }
}
