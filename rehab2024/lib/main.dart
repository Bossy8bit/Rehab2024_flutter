

// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:go_router/go_router.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'HomeScreen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
// class _MyAppState extends State<MyApp> {
//   Locale _locale = Locale('en'); // Default locale

//   // Function to update the app's locale
//   void _changeLanguage(Locale locale) {
//     setState(() {
//       _locale = locale;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final GoRouter _router = GoRouter(
//       routes: [
//         GoRoute(
//           path: '/',
//           builder: (context, state) => HomeScreen(),
//         ),
//       ],
//     );

//     return MaterialApp.router(
//       routerConfig: _router,
//       locale: _locale, // Set the locale for the entire app
//       debugShowCheckedModeBanner: false,
//       localizationsDelegates: [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: AppLocalizations.supportedLocales,
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'HomeScreen.dart';



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
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(changeLanguage: _changeLanguage), // Pass changeLanguage to HomeScreen
        ),
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
