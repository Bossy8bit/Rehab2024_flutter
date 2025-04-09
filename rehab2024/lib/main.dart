

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rehab2024/ByAnatomy.dart';
import 'package:rehab2024/BySymtom.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rehab2024/ExerciseCard.dart';
import 'ExerciseList.dart';
import 'HomeScreen.dart';

part 'main.g.dart';

@HiveType(typeId: 0)
class Exercise {
  @HiveField(0)
  String name;

  @HiveField(1)
  String type;

  @HiveField(2)
  String side;

  @HiveField(3)
  String anatomy;

  @HiveField(4)
  String symptom;

  @HiveField(5)
  int holdFor;

  @HiveField(6)
  int repeatFor;

  @HiveField(7)
  int doPerDay;

  @HiveField(8)
  String imagePath; // ✅ Store asset image path instead of Uint8List

  Exercise({
  required this.name,
  required this.type,
  required this.side,
  required this.anatomy,
  required this.symptom,
  required this.holdFor,
  required this.repeatFor,
  required this.doPerDay,
  String? imagePath, // Allow null values
  }) : imagePath = imagePath ?? ""; // Empty string triggers icon

}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ExerciseAdapter());

  var box = await Hive.openBox<Exercise>('exerciseBox');

 
  List<Exercise> exercises = [
    
  Exercise(
    name: "Stretching left splenius muscle",
    type: "Stretch (F)",
    side: "Left (L)",
    anatomy: "Neck",
    symptom: "-",
    holdFor: 10,
    repeatFor: 10,
    doPerDay: 3,
    imagePath: "lib/assets/HTMLres/AnAS01-1.png",
  ),
  Exercise(
    name: "Stretching left upper trapezius muscle ท่า 1",
    type: "Stretch (F)",
    side: "Left (L)",
    anatomy: "Shoulder",
    symptom: "-",
    holdFor: 10,
    repeatFor: 10,
    doPerDay: 3,
    imagePath: "lib/assets/HTMLres/AnAS01-1.png",
  ),
  Exercise(
    name: "Stretching left upper trapezius muscle ท่า 2",
    type: "Stretch (F)",
    side: "Left (L)",
    anatomy: "Shoulder",
    symptom: "-",
    holdFor: 10,
    repeatFor: 10,
    doPerDay: 3,
    imagePath: "lib/assets/HTMLres/AnAS01-1.png",
  ),
  Exercise(
    name: "Stretching left levator scapulae muscle",
    type: "Stretch (F)",
    side: "Left (L)",
    anatomy: "Shoulder",
    symptom: "-",
    holdFor: 10,
    repeatFor: 10,
    doPerDay: 3,
    imagePath: "lib/assets/HTMLres/AnAS01-1.png",
  ),
  Exercise(
    name: "Stretching left quadratus lumborum muscle ท่า 1",
    type: "Stretch (F)",
    side: "Left (L)",
    anatomy: "Back",
    symptom: "-",
    holdFor: 10,
    repeatFor: 10,
    doPerDay: 3,
    imagePath: "lib/assets/HTMLres/AnAS01-1.png",
  ),
  Exercise(
    name: "Stretching left gluteus maximus muscle ท่า 1",
    type: "Stretch (F)",
    side: "Left (L)",
    anatomy: "Hip",
    symptom: "-",
    holdFor: 10,
    repeatFor: 10,
    doPerDay: 3,
    imagePath: "lib/assets/HTMLres/AnAS01-1.png",
  ),
  Exercise(
    name: "Stretching left quadriceps muscle ท่า 1",
    type: "Stretch (F)",
    side: "Left (L)",
    anatomy: "Knee",
    symptom: "-",
    holdFor: 10,
    repeatFor: 10,
    doPerDay: 3,
    imagePath: "lib/assets/HTMLres/AnAS01-1.png",
  ),
  Exercise(
    name: "Stretching left hamstring muscle",
    type: "Stretch (F)",
    side: "Left (L)",
    anatomy: "Knee",
    symptom: "-",
    holdFor: 10,
    repeatFor: 10,
    doPerDay: 3,
    imagePath: "lib/assets/HTMLres/AnAS01-1.png",
  ),
  Exercise(
    name: "Stretching left gastrocnemius muscle ท่า 1",
    type: "Stretch (F)",
    side: "Left (L)",
    anatomy: "Ankle",
    symptom: "-",
    holdFor: 10,
    repeatFor: 10,
    doPerDay: 3,
    imagePath: "lib/assets/HTMLres/AnAS01-1.png",
  ),
  Exercise(
    name: "Isometric neck exercise",
    type: "Strengthen (S)",
    side: "All (A)",
    anatomy: "Neck",
    symptom: "-",
    holdFor: 10,
    repeatFor: 10,
    doPerDay: 3,
    imagePath: "lib/assets/HTMLres/AnAS01-1.png",
  ),

];
// Directly store the list in Hive (no default, always overwrites)
  await box.putAll({for (var ex in exercises) ex.name: ex});
  
  print("✅ Exercises stored successfully!");

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
        GoRoute(
          path: '/byanatomy',
          builder: (context, state) => ByAnatomy(changeLanguage: _changeLanguage),
        ),
         GoRoute(
          path: '/bysymtom',
          builder: (context, state) => BySymtom(changeLanguage: _changeLanguage),
        ),
        GoRoute(
          path: '/exercisecard',
          builder: (context, state) => ExerciseCardScreen(changeLanguage: _changeLanguage),
        ),

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
