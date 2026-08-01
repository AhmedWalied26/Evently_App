// ignore_for_file: use_build_context_synchronously
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/model/user_model.dart';
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

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController(
    text: 'Ahmed',
  );
  final TextEditingController emailController = TextEditingController(
    text: 'ahmed@route.com',
  );
  final TextEditingController passwordController = TextEditingController(
    text: 'AAaa@#123',
  );
  final TextEditingController rePasswordController = TextEditingController(
    text: 'AAaa@#123',
  );
  bool isObsecuredPassword = true;
  bool isObsecuredRePassword = true;

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Stack(
      children: [
        Scaffold(
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
                        AppLocalizations.of(context)!.createYourAccount,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: height * 0.024),
                      CustomTextField(
                        controller: userNameController,
                        validation: (value) {
                          return AppValidation.validateUserName(value);
                        },
                        title: AppLocalizations.of(context)!.enterYourName,
                        prefix: SvgPicture.asset(AppAssets.profileIcon),
                      ),
                      SizedBox(height: height * 0.016),
                      CustomTextField(
                        type: .emailAddress,
                        controller: emailController,
                        validation: (value) {
                          return AppValidation.validateEmail(value);
                        },
                        title: AppLocalizations.of(context)!.enterYourEmail,
                        prefix: SvgPicture.asset(AppAssets.emailIcon),
                      ),
                      SizedBox(height: height * 0.016),
                      CustomTextField(
                        isObsecure: isObsecuredPassword,
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
                            isObsecuredPassword = !isObsecuredPassword;
                            setState(() {});
                          },
                          icon: Icon(
                            isObsecuredPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.lightGreyColor,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.016),
                      CustomTextField(
                        isObsecure: isObsecuredRePassword,
                        controller: rePasswordController,
                        validation: (value) {
                          return AppValidation.validateConfirmPassword(
                            value,
                            passwordController.text,
                          );
                        },
                        title: AppLocalizations.of(
                          context,
                        )!.confirmYourPassword,
                        prefix: SvgPicture.asset(AppAssets.passwordIcon),
                        suffix: IconButton(
                          style: IconButton.styleFrom(
                            overlayColor: AppColors.transparentColor,
                          ),
                          onPressed: () {
                            isObsecuredRePassword = !isObsecuredRePassword;
                            setState(() {});
                          },
                          icon: Icon(
                            isObsecuredRePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.lightGreyColor,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      CustomButton(
                        isLoading: isLoading,
                        title: AppLocalizations.of(context)!.signup,
                        onTap: register,
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.alreadyHaveAccount,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          CustomTextButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: AppLocalizations.of(context)!.login,
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
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
                        title: AppLocalizations.of(context)!.signupWithGoogle,
                        onTap: signUpWithGoogleButton,
                        child: Image.asset(AppAssets.googleImage),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (isLoadingGoogle)
          Container(
            color: AppColors.transparentColor.withValues(alpha: .5),
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
      ],
    );
  }

  bool isLoading = false;
  void register() async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        UserModel userModel = UserModel(
          uId: credential.user?.uid ?? '',
          email: emailController.text,
          name: userNameController.text,
        );

        FirebaseUtils.addUserInFireStore(userModel);

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.upadateUser(userModel);

        ScaffoldMessenger.of(context).showSnackBar(
          SnakbarUtils.snackBar(
            title: 'Created Account Successfully',
            context: context,
          ),
        );
        await Future.delayed(Duration(seconds: 1));
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        Navigator.pushNamed(context, AppRoutes.homeRouteName);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnakbarUtils.snackBar(
              isError: true,
              title: 'The account already exists for that email.',
              context: context,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnakbarUtils.snackBar(
            isError: true,
            title: e.toString(),
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

  bool isLoadingGoogle = false;
  void signUpWithGoogleButton() async {
    setState(() {
      isLoadingGoogle = true;
    });

    final userCredential = await FirebaseUtils.signInWithGoogle();

    if (!context.mounted) {
      return;
    }
    if (userCredential != null) {
      final user = await FirebaseUtils.readUserFromFireStore(
        userCredential.user!.uid,
      );
      if (user != null) {
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.upadateUser(user);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnakbarUtils.snackBar(title: 'Login Successfully', context: context),
      );
      await Future.delayed(Duration(seconds: 1));
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (!context.mounted) return;
      setState(() {
        isLoadingGoogle = false;
      });
      Navigator.pushNamed(context, AppRoutes.homeRouteName);
    }
  }
}
