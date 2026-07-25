import 'package:evently_app/services/shared_prefs.dart';
import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  AppThemeProvider() {
    loadTheme();
  }

  Future<void> loadTheme() async {
    String? theme = await SharedPrefs.getTheme();

    if (theme != null) {
      appTheme = theme == 'dark' ? .dark : .light;
      notifyListeners();
    }
  }

  Future<void> changeTheme(ThemeMode newTheme) async {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;

    await SharedPrefs.saveTheme(newTheme.name);

    notifyListeners();
  }

  Future<void> changeThemeButton() async {
    if (appTheme == .light) {
      appTheme = .dark;
    } else {
      appTheme = .light;
    }
    await SharedPrefs.saveTheme(appTheme.name);
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  bool get isDark => appTheme == ThemeMode.dark;
}
