// ignore_for_file: use_build_context_synchronously
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_validation.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/utils/snakbar_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:evently_app/widgets/custom_text_button.dart';
import 'package:evently_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(
    text: 'ahmed@route.com',
  );
  final TextEditingController passwordController = TextEditingController(
    text: 'AAaa@#123',
  );
  bool isObsecured = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                    AppLocalizations.of(context)!.loginToYourAccount,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: height * 0.024),
                  CustomTextField(
                    type: .emailAddress,
                    validation: (value) {
                      return AppValidation.validateEmail(value);
                    },
                    controller: emailController,
                    title: AppLocalizations.of(context)!.enterYourEmail,
                    prefix: SvgPicture.asset(AppAssets.emailIcon),
                  ),
                  SizedBox(height: height * 0.016),
                  CustomTextField(
                    isObsecure: isObsecured,
                    controller: passwordController,
                    validation: (value) {
                      return AppValidation.validatePassword(value);
                    },
                    title: AppLocalizations.of(context)!.enterYourPassword,
                    prefix: SvgPicture.asset(AppAssets.passwordIcon),
                    suffix: IconButton(
                      style: IconButton.styleFrom(
                        overlayColor: AppColors.transparentColor,
                      ),
                      onPressed: () {
                        isObsecured = !isObsecured;
                        setState(() {});
                      },
                      icon: Icon(
                        isObsecured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
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
                        title: AppLocalizations.of(
                          context,
                        )!.forgotPasswordQuestion,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.04),
                  CustomButton(
                    isLoading: isLoading,
                    title: AppLocalizations.of(context)!.login,
                    onTap: login,
                  ),
                  SizedBox(height: height * 0.04),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dontHaveAccount,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      CustomTextButton(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.registerRouteName,
                          );
                        },
                        title: AppLocalizations.of(context)!.signup,
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
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
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
                    title: AppLocalizations.of(context)!.loginWithGoogle,
                    onTap: () {},
                    child: Image.asset(AppAssets.googleImage),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isLoading = false;

  void login() async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );

        var myUser = await FirebaseUtils.readUserFromFireStore(
          credential.user?.uid ?? '',
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.upadateUser(myUser!);

        ScaffoldMessenger.of(context).showSnackBar(
          SnakbarUtils.snackBar(title: 'Login Successfully', context: context),
        );

        Navigator.pushNamed(context, AppRoutes.homeRouteName);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnakbarUtils.snackBar(
              title: 'No user found for that email or wrong password.',
              isError: true,
              context: context,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnakbarUtils.snackBar(
            title: e.toString(),
            isError: true,
            context: context,
          ),
        );
      } finally {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    }
  }
}
