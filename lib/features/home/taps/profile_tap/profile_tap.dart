import 'dart:io';
import 'package:evently_app/features/home/taps/profile_tap/widgets/custom_bottom_sheet.dart';
import 'package:evently_app/features/home/taps/profile_tap/widgets/setting_tile.dart';
import 'package:evently_app/features/home/taps/profile_tap/widgets/switch_mode.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({super.key});

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  File? selectedImage;

  final picker = ImagePicker();
  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: height * 0.032),
          InkWell(
            overlayColor: WidgetStatePropertyAll(AppColors.transparentColor),
            onTap: () {
              pickImage();
            },
            child: CircleAvatar(
              radius: 66,
              backgroundColor: Theme.of(context).cardColor,
              child: CircleAvatar(
                radius: 62,
                backgroundImage: selectedImage == null
                    ? AssetImage(AppAssets.routeLogoImage)
                    : FileImage(selectedImage!),
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
          Text(
            userProvider.userModel!.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: height * 0.01),
          Text(
            userProvider.userModel!.email,
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
          InkWell(
            overlayColor: WidgetStateProperty.all(AppColors.transparentColor),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.loginRouteName,
                (route) => false,
              );
            },
            child: SettingTile(
              horiMargin: width * 0.04,
              title: AppLocalizations.of(context)!.logout,
              child: SvgPicture.asset(
                AppAssets.logoutIcon,
                width: 26,
                height: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
