import 'package:flutter/material.dart';

import '../model/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel theme = ThemeModel(isDark: false);

  void changeTheme() {
    theme.isDark = !theme.isDark;
    notifyListeners();
  }
}
