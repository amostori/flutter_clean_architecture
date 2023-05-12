import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark == true ? _isDark = false : _isDark = true;
    notifyListeners();
  }
}
