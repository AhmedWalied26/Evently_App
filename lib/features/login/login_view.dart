import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:evently_app/widgets/custom_text_button.dart';
import 'package:evently_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Form(
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                SizedBox(height: height * 0.04),
                Image.asset(
                  themeProvider.isDark
                      ? AppAssets.eventlyLogoDarkImage
                      : AppAssets.eventlyLogoLightImage,
                  height: 27,
                ),
                SizedBox(height: height * 0.06),
                Text(
                  'Login to your account',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: height * 0.024),
                CustomTextField(
                  title: 'Enter your email',
                  prefix: SvgPicture.asset(AppAssets.emailIcon),
                ),
                SizedBox(height: height * 0.016),
                CustomTextField(
                  title: 'Enter your password',
                  prefix: SvgPicture.asset(AppAssets.passwordIcon),
                  suffix: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_off_outlined,
                      color: AppColors.lightGreyColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    CustomTextButton(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.resetPasswordRouteName,
                        );
                      },
                      title: 'Forget Password?',
                    ),
                  ],
                ),
                SizedBox(height: height * 0.04),
                CustomButton(
                  title: 'Login',
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.homeRouteName);
                  },
                ),
                SizedBox(height: height * 0.04),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    CustomTextButton(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.registerRouteName,
                        );
                      },
                      title: 'Signup',
                    ),
                  ],
                ),
                SizedBox(height: height * 0.032),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        endIndent: width * 0.04,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                    Text('Or', style: Theme.of(context).textTheme.labelMedium),
                    Expanded(
                      child: Divider(
                        indent: width * 0.04,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.024),
                CustomButton(
                  hasIcon: true,
                  title: 'Login with Google',
                  onTap: () {},
                  child: Image.asset(AppAssets.googleImage),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
