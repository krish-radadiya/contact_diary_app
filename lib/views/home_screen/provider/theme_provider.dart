import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel thememodel;

  ThemeProvider({required ThemeModel thememodel}) : thememodel = thememodel;

  void changeTheme() async {
    thememodel.isDark = !thememodel.isDark;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isdark', thememodel.isDark);
    notifyListeners();
  }
}
