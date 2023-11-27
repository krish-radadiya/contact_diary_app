import 'package:contact_diary_app/views/home_screen/model/theme_model.dart';
import 'package:contact_diary_app/views/home_screen/provider/theme_provider.dart';
import 'package:contact_diary_app/views/home_screen/views/theme_data.dart';
import 'package:contact_diary_app/views/add_contact_screen/views/add_contact.dart';
import 'package:contact_diary_app/views/home_screen/provider/counter_provider.dart';
import 'package:contact_diary_app/views/home_screen/views/homepage.dart';
import 'package:contact_diary_app/views/introduction_screen/views/introducation_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isvisited = preferences.getBool('isvisited') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<CounterProvider>(
            create: (context) => CounterProvider()),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(
            thememodel: ThemeModel(
              isDark: preferences.getBool('isdark') ?? false,
            ),
          ),
        ),
      ],
      builder: (context, widget) => MaterialApp(
        theme: apptheme.lighttheme,
        darkTheme: apptheme.darktheme,
        themeMode:
            (Provider.of<ThemeProvider>(context).thememodel.isDark == true)
                ? ThemeMode.dark
                : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        initialRoute: (isvisited) ? 'home' : '/',
        routes: {
          '/': (context) => const introduction_screen(),
          'home': (context) => const homepage(),
          'add': (context) => const add_contact(),
        },
      ),
    ),
  );
}
