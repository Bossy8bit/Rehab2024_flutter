// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:path/path.dart';
// import 'screens/splash_screen.dart';
// import 'package:flutter/foundation.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
//     sqfliteFfiInit();
//   }
  
//   runApp(const RehabXApp());
// }

// class RehabXApp extends StatelessWidget {
//   const RehabXApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Rehab X',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent).copyWith(
//           secondary: Colors.lightBlueAccent,
//         ),
//         useMaterial3: true,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.blueAccent,
//           foregroundColor: Colors.white,
//           elevation: 4,
//           centerTitle: true,
//         ),
//         floatingActionButtonTheme: FloatingActionButtonThemeData(
//           backgroundColor: Colors.lightBlueAccent,
//           foregroundColor: Colors.white,
//         ),
//         cardTheme: CardTheme(
//           elevation: 2,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         buttonTheme: ButtonThemeData(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           buttonColor: Colors.blueAccent,
//           textTheme: ButtonTextTheme.primary,
//         ),
//         textTheme: const TextTheme(
//           titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.blueGrey),
//           titleMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blueGrey),
//           bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black87),
//           bodySmall: TextStyle(fontSize: 14.0, color: Colors.black54),
//         ),
//       ),
//       localizationsDelegates: const [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: const [
//         Locale('en', ''),
//         Locale('th', ''),
//       ],
//       home: const SplashScreen(),
//     );
//   }
// }
// อันนี้ version 1.0

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'screens/splash_screen.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    sqfliteFfiInit();
  }
  runApp(const RehabXApp());
}

class RehabXApp extends StatelessWidget {
  const RehabXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rehab X',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // เพิ่ม fontFamily สำหรับ system font
        fontFamily: _getSystemFont(),
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent).copyWith(
          secondary: Colors.lightBlueAccent,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.lightBlueAccent,
          foregroundColor: Colors.white,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          buttonColor: Colors.blueAccent,
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 24.0, 
            fontWeight: FontWeight.bold, 
            color: Colors.blueGrey,
            fontFamily: _getSystemFont(), // ใช้ system font
          ),
          titleMedium: TextStyle(
            fontSize: 20.0, 
            fontWeight: FontWeight.bold, 
            color: Colors.blueGrey,
            fontFamily: _getSystemFont(),
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0, 
            color: Colors.black87,
            fontFamily: _getSystemFont(),
          ),
          bodySmall: TextStyle(
            fontSize: 14.0, 
            color: Colors.black54,
            fontFamily: _getSystemFont(),
          ),
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('th', ''),
      ],
      home: const SplashScreen(),
    );
  }

  // ฟังก์ชันสำหรับเลือก system font ตาม platform
  String? _getSystemFont() {
    if (kIsWeb) {
      return null; // ใช้ browser default font
    }
    
    if (Platform.isIOS) {
      return '.SF Pro Text'; // iOS system font
    } else if (Platform.isAndroid) {
      return 'Roboto'; // Android system font
    } else if (Platform.isWindows) {
      return 'Segoe UI'; // Windows system font
    } else if (Platform.isMacOS) {
      return '.SF Pro Text'; // macOS system font
    } else if (Platform.isLinux) {
      return 'Ubuntu'; // Linux common system font
    }
    
    return null; // fallback to default
  }
}