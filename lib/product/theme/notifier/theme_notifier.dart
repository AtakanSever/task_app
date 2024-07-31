import 'package:flutter/material.dart';
import 'package:task_app/product/theme/custom_dark_theme.dart';
import 'package:task_app/product/theme/custom_light_theme.dart';
import 'package:task_app/product/utility/enums/app_theme.dart';

final class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = CustomLightTheme().themeData;

  AppThemes _currenThemeEnum = AppThemes.LIGHT;

  /// Applicaton theme enum.
  /// Deafult value is [AppThemes.LIGHT]
  AppThemes get currenThemeEnum => _currenThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = CustomLightTheme().themeData;
    } else {
      _currentTheme = CustomDarkTheme().themeData;
    }
    notifyListeners();
  }

  /// Change your app theme with [currenThemeEnum] value.
  void changeTheme() {
    if (_currenThemeEnum == AppThemes.LIGHT) {
      _currentTheme = CustomDarkTheme().themeData;
      _currenThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = CustomLightTheme().themeData;
      _currenThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }
}
