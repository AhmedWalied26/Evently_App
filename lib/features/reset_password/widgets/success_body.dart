import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SuccessBody extends StatelessWidget {
  final TextEditingController emailController;
  const SuccessBody({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Column(
      children: [
        Row(
          spacing: width * 0.01,
          mainAxisAlignment: .center,
          children: [
            Text(
              AppLocalizations.of(context)!.email_sent,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Icon(Icons.check_circle, color: AppColors.greenColor, size: 25),
          ],
        ),
        SizedBox(height: height * 0.02),
        Text(
          AppLocalizations.of(context)!.email_sent_description,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(emailController.text),
        // Text('ahmedwh0011@gmail.com'),
        SizedBox(height: height * 0.02),
        Text(
          textAlign: .center,
          AppLocalizations.of(context)!.check_your_inbox,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: height * 0.04),
        CustomButton(
          title: AppLocalizations.of(context)!.back_to_login,
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.loginRouteName,
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}
