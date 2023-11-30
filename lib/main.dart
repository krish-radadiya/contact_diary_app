import 'package:contact_diary_app/views/add_contact_screen/provider/contact_provider/contact_provider.dart';
import 'package:contact_diary_app/views/contact_details/views/contact_details.dart';
import 'package:contact_diary_app/views/home_screen/model/theme_model.dart';
import 'package:contact_diary_app/views/home_screen/provider/theme_provider.dart';
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
  bool isDark = preferences.getBool("isDark") ?? false;

  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<CounterProvider>(
            create: (context) => CounterProvider()),
        ListenableProvider(
          create: (context) => ThemeProvider(
            themeModel: ThemeModel(isDark: isDark),
          ),
        ),
      ],
      builder: (context, widget) => MaterialApp(
        // theme: apptheme.lighttheme,
        // darkTheme: apptheme.darktheme,
        // themeMode:
        //     (Provider.of<ThemeProvider>(context).themeModel.isDark == true)
        //         ? ThemeMode.light
        //         : ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        initialRoute: (isvisited) ? 'home' : '/',
        routes: {
          '/': (context) => const introduction_screen(),
          'home': (context) => homepage(),
          'add': (context) => const add_contact(),
          'details': (context) => Contact_Detail(),
        },
      ),
    ),
  );
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//
//   bool isDark = preferences.getBool('isDark') ?? false;
//
//   runApp(
//     MultiProvider(
//       providers: [
//         ListenableProvider<CounterProvider>(create: (ctx) => CounterProvider()),
//         ListenableProvider<ContactProvider>(create: (ctx) => ContactProvider()),
//         ListenableProvider<ThemeProvider>(
//             create: (ctx) => ThemeProvider(theme: ThemeModel(isDark: isDark))),
//       ],
//       builder: (ctx, _) => MaterialApp(
//         theme: Themes.lightTheme,
//         darkTheme: Themes.darkTheme,
//         themeMode: (Provider.of<ThemeProvider>(ctx).theme.isDark == true)
//             ? ThemeMode.dark
//             : ThemeMode.light,
//         debugShowCheckedModeBanner: false,
//         routes: {
//           '/': (ctx) => Splash_Screen(),
//           'intro': (ctx) => const Intro_Screen(),
//           'home': (ctx) => HomeScreen(),
//           'add_contact': (ctx) => const Add_Contact_Screen(),
//           'detail': (ctx) => Contact_Detail_Screen(),
//         },
//       ),
//     ),
//   );
// }
