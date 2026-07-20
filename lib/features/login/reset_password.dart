import 'package:evently_app/features/onboarding/widgets/skip_button.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = context.height;
    var width = context.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Forget Password',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        leading: Row(
          children: [
            SizedBox(width: width * 0.035),
            SkipButton(
              onTap: () {
                Navigator.pop(context);
              },
              hasIcon: true,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.036),
        child: Column(
          spacing: height * 0.04,
          crossAxisAlignment: .stretch,
          children: [
            SizedBox(height: 0.04),
            Image.asset(
              themeProvider.isDark
                  ? AppAssets.resetPasswordDarkImage
                  : AppAssets.resetPasswordLightImage,
              width: .infinity,
              fit: .cover,
            ),
            CustomButton(title: 'Reset password', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
