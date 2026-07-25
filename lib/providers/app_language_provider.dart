import 'package:evently_app/services/shared_prefs.dart';
import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = 'en';

  AppLanguageProvider() {
    loadLanguage();
  }

  Future<void> loadLanguage() async {
    String? language = await SharedPrefs.getLanguage();

    if (language != null) {
      appLanguage = language;
      notifyListeners();
    }
  }

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;

    await SharedPrefs.saveLanguage(newLanguage);

    notifyListeners();
  }

  Future<void> changeLanguageButton() async {
    if (appLanguage == 'en') {
      appLanguage = 'ar';
    } else {
      appLanguage = 'en';
    }
    await SharedPrefs.saveLanguage(appLanguage);

    notifyListeners();
  }
}
