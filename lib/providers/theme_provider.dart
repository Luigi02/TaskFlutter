import 'package:flutter/material.dart';


class ThemeModeProvider extends ChangeNotifier {
 
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  Future<void> changeTheme() async {

    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}