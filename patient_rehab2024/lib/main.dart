

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rehab2024/QrcodeScanner.dart';
import 'package:rehab2024/RatingScreen.dart';

import 'ExerciseList.dart';
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
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    // สร้าง GoRouter ครั้งเดียวใน initState
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(changeLanguage: _changeLanguage),
        ),
        GoRoute(
          path: '/exercise-list',
          builder: (context, state) => Exerciselist(changeLanguage: _changeLanguage),
        ),
        // GoRoute(
        //   path: '/qrcode',
        //   builder: (context, state) => QRCodePageHomeScreen(changeLanguage: _changeLanguage),
        // ),
        GoRoute(
          path: '/ratingscreen',
          builder: (context, state) => RatingScreen(changeLanguage: _changeLanguage),
        )
      ],
    );
  }

  // ฟังก์ชันสำหรับเปลี่ยนภาษา
  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router, // ใช้ GoRouter ที่สร้างใน initState
      locale: _locale, // อัปเดตภาษา
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
