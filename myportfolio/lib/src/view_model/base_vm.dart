import 'package:flutter/material.dart';
import 'package:myportfolio/constants/constants.dart';

class BaseVM extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    Constant.themeMode = themeMode.toString();
    update();
  }

  void update() {
    notifyListeners();
  }
}
