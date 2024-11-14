

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rehab2024/CustomScaffold.dart';
import 'HomeScreen.dart';

import 'MenuButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en'); // Default locale

  // Function to update the app's locale
  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Configure GoRouter with the routes
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(changeLanguage: _changeLanguage,),
    ),
    // GoRoute(
    //   path: '/form',
    //   builder: (context, state) => FormExample(changeLanguage: _changeLanguage,),
    // ),
    
  ],
);

    return MaterialApp.router(
      routerConfig: _router,
      locale: _locale, // Set the locale for the entire app
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
