import 'package:flutter/material.dart';
import 'package:rehab_x_patient/screens/bysymptom/frozen_shoulder_screen.dart';
import 'package:rehab_x_patient/screens/bysymptom/low_back_pain_screen.dart';
import 'package:rehab_x_patient/screens/bysymptom/oa_knee_screen.dart';
import 'package:rehab_x_patient/screens/exercise_list_screen.dart';
import 'qr_scanner_screen.dart';
import '../models/exercise.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseBySymptomScreen extends StatefulWidget {
  const ExerciseBySymptomScreen({super.key});

  @override
  State<ExerciseBySymptomScreen> createState() => _ExerciseBySymptomScreen();
}

class _ExerciseBySymptomScreen extends State<ExerciseBySymptomScreen> {

  List<Exercise> _exercises = [];
 

  @override
  void initState() {
    super.initState();
  ;
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rehab X', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QRScannerScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,//remove space under container 
              children: [
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 6, 157, 26),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  FrozenShoulderScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                                        'assets/svg_icons/head_button_icon9.svg',
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                      ),
                        const SizedBox(height: 8),
                        const Text('Frozen Shoulder', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 228, 188, 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  LowBackPainScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        SvgPicture.asset(
                                        'assets/svg_icons/head_button_icon11.svg',
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                      ),
                        SizedBox(height: 8),
                        Text('Low Back Pain', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 206, 13, 224),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const OAKneeScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        SvgPicture.asset(
                                        'assets/svg_icons/head_button_icon15.svg',
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                      ),
                        SizedBox(height: 8),
                        Text('OA Knee', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
