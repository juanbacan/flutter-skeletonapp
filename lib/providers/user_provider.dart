
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{ 

  ThemeData currentTheme;

  UserProvider({
    required bool isDarkmode
  }): currentTheme = isDarkmode ? ThemeData.dark() : ThemeData.light();

  bool get isDarkmode => currentTheme == ThemeData.dark();

  void setLightMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  void setDarkmode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}
