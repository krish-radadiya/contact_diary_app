import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel themeModel;

  ThemeProvider({required this.themeModel});

  void changeTheme() async {
    themeModel.isDark = !themeModel.isDark;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("is Dark", themeModel.isDark);

    notifyListeners();
  }
}
