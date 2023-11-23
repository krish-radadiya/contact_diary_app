import 'package:contact_diary_app/utils/theme/theme_data.dart';
import 'package:contact_diary_app/views/add_contact_screen/views/add_contact.dart';
import 'package:contact_diary_app/views/home_screen/views/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: apptheme.lighttheme,
      darkTheme: apptheme.darktheme,
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => const homepage(),
        'add': (context) => const add_contact(),
      },
    ),
  );
}
