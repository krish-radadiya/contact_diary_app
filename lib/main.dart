import 'package:contact_diary_app/utils/theme/provider/theme_provider.dart';
import 'package:contact_diary_app/utils/theme/theme_data.dart';
import 'package:contact_diary_app/views/add_contact_screen/views/add_contact.dart';
import 'package:contact_diary_app/views/home_screen/provider/counter_provider.dart';
import 'package:contact_diary_app/views/home_screen/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<CounterProvider>(create: (ctx) => CounterProvider()),
        ListenableProvider<ThemeProvider>(create: (ctx) => ThemeProvider()),
      ],
      builder: (ctx, _) => MaterialApp(
        theme: apptheme.lighttheme,
        darkTheme: apptheme.darktheme,
        themeMode: (Provider.of<ThemeProvider>(ctx).theme.isDark == true)
            ? ThemeMode.dark
            : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const homepage(),
          'add': (context) => const add_contact(),
        },
      ),
    ),
  );
}
