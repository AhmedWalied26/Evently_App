import 'package:evently_app/features/home/home_view.dart';
import 'package:evently_app/features/login/login_view.dart';
import 'package:evently_app/features/login/reset_password.dart';
import 'package:evently_app/features/onboarding/customize_view.dart';
import 'package:evently_app/features/onboarding/onboarding_view.dart';
import 'package:evently_app/features/register/register_view.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
      ],
      child: const EventlyApp(),
    ),
  );
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.cusomizeRouteName,
      routes: {
        AppRoutes.cusomizeRouteName: (context) => CustomizeView(),
        AppRoutes.onboardingRouteName: (context) => OnboardingView(),
        AppRoutes.homeRouteName: (context) => HomeView(),
        AppRoutes.loginRouteName: (context) => LoginView(),
        AppRoutes.resetPasswordRouteName: (context) => ResetPassword(),
        AppRoutes.registerRouteName: (context) => RegisterView(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}
