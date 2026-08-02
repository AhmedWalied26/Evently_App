// ignore_for_file: use_build_context_synchronously
import 'package:evently_app/features/onboarding/widgets/skip_button.dart';
import 'package:evently_app/features/reset_password/widgets/default_body.dart';
import 'package:evently_app/features/reset_password/widgets/success_body.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/utils/snakbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isEmailSent = false;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = context.height;
    var width = context.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.forgotPassword,
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
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Image.asset(
                themeProvider.isDark
                    ? AppAssets.resetPasswordDarkImage
                    : AppAssets.resetPasswordLightImage,
                width: .infinity,
                fit: .cover,
              ),
              SizedBox(height: height * 0.02),
              isEmailSent
                  ? SuccessBody(emailController: emailController)
                  : DefaultBody(
                      isLoading: isLoading,
                      emailController: emailController,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          final exists = await FirebaseUtils.checkEmail(
                            emailController.text.trim(),
                          );
                          if (!exists) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnakbarUtils.snackBar(
                                isError: true,
                                title: 'No account found with this email',
                                context: context,
                              ),
                            );
                            setState(() {
                              isLoading = false;
                            });
                            return;
                          }
                          await resetPass(emailController.text);
                          setState(() {
                            isEmailSent = true;
                            isLoading = false;
                          });
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  bool isLoading = false;
  Future<void> resetPass(String email) async {
    await FirebaseUtils.resetPasswordWithEmail(email);
  }
}
