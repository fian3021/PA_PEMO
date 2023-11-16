import 'package:flutter/material.dart';

class ThemeModeData extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  bool get isDarkModeActive => _themeMode == ThemeMode.dark;

  Color _defaultColor = Color.fromRGBO(4, 87, 98, 1);

  Color get defaultColor => _defaultColor;

  void setTheme(Color defaultColor) {
    _defaultColor = defaultColor;
    notifyListeners();
  }

  void changeTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
