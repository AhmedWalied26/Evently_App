import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_validation.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:evently_app/widgets/custom_text_button.dart';
import 'package:evently_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultBody extends StatefulWidget {
  final TextEditingController emailController;
  final VoidCallback onTap;
  final bool isLoading;
  const DefaultBody({
    super.key,
    required this.emailController,
    required this.onTap,
    required this.isLoading,
  });

  @override
  State<DefaultBody> createState() => _DefaultBodyState();
}

class _DefaultBodyState extends State<DefaultBody> {
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text(
          textAlign: .center,
          AppLocalizations.of(context)!.forgotPasswordQuestion,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: height * 0.01),
        Text(
          textAlign: .center,
          AppLocalizations.of(context)!.forgot_password_description,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: height * 0.02),
        Text(
          AppLocalizations.of(context)!.email_address,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: height * 0.01),
        CustomTextField(
          type: .emailAddress,
          validation: (value) {
            return AppValidation.validateEmail(context, value);
          },
          controller: widget.emailController,
          title: AppLocalizations.of(context)!.email_placeholder,
          prefix: SvgPicture.asset(AppAssets.emailIcon),
        ),
        SizedBox(height: height * 0.04),
        CustomButton(
          isLoading: widget.isLoading,
          title: AppLocalizations.of(context)!.resetPassword,
          onTap: widget.onTap,
        ),
        SizedBox(height: height * 0.01),
        Row(
          mainAxisAlignment: .center,
          children: [
            Text(
              AppLocalizations.of(context)!.remember_your_password,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            CustomTextButton(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.loginRouteName);
              },
              title: AppLocalizations.of(context)!.login,
            ),
          ],
        ),
      ],
    );
  }
}
