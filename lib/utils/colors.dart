import 'dart:ui';

import 'enums.dart';

class AppColors {
  static Themes _theme = Themes.dark;

  void changeTheme(Themes theme) {
    _theme = theme;
  }

  static var primary = _theme == Themes.light ? Color(0xFF000000) : Color(0xFFFFFFFF);

  static var secondary =_theme == Themes.light ? Color(0xFF86878D) : Color(0xFFA19EB7);

  static var tertiary = _theme == Themes.light ? Color(0xFF3C3C43) : Color(0xFFA19EB7);

  static var quart = _theme == Themes.light ? Color(0xFFD3D5DA) : Color(0xFF524E77);
}
