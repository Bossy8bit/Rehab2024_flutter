import 'package:flutter/material.dart';
import 'package:rehab_x_patient/screens/bybody/ankle_screen.dart';
import 'package:rehab_x_patient/screens/bybody/arm_screen.dart';
import 'package:rehab_x_patient/screens/bybody/back_screen.dart';
import 'package:rehab_x_patient/screens/bybody/foot_screen.dart';
import 'package:rehab_x_patient/screens/bybody/hip_screen.dart';
import 'package:rehab_x_patient/screens/bybody/knee_screen.dart';
import 'package:rehab_x_patient/screens/bybody/shoulder_screen.dart';
import 'package:rehab_x_patient/screens/exercise_list_screen.dart';
import 'bybody/neck_screen.dart';
import 'qr_scanner_screen.dart';
import '../models/exercise.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseByBodyScreen extends StatefulWidget {
  const ExerciseByBodyScreen({super.key});

  @override
  State<ExerciseByBodyScreen> createState() => _ExerciseByBodyScreen();
}

class _ExerciseByBodyScreen extends State<ExerciseByBodyScreen> {

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
                      backgroundColor: const Color.fromARGB(255, 2, 100, 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  NeckScreen()),
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
                        const Text('คอ', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
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
                      backgroundColor: const Color.fromARGB(255, 4, 206, 47),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ShoulderScreen()),
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
                        Text('หัวไหล่', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
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
                      backgroundColor: const Color.fromARGB(255, 157, 137, 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ArmScreen()),
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
                        Text('แขน', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
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
                      backgroundColor: const Color.fromARGB(255, 244, 111, 3),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  BackScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        SvgPicture.asset(
                                        'assets/svg_icons/head_button_icon10.svg',
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                      ),
                        SizedBox(height: 8),
                        Text('หลัง', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
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
                      backgroundColor: const Color.fromARGB(255, 148, 40, 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HipScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        SvgPicture.asset(
                                        'assets/svg_icons/head_button_icon12.svg',
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                      ),
                        SizedBox(height: 8),
                        Text('สะโพก', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
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
                      backgroundColor: const Color.fromARGB(255, 130, 14, 156),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  KneeScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        SvgPicture.asset(
                                        'assets/svg_icons/head_button_icon13.svg',
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                      ),
                        SizedBox(height: 8),
                        Text('เข่า', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
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
                      backgroundColor: const Color.fromARGB(255, 81, 101, 229),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  AnkleScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        SvgPicture.asset(
                                        'assets/svg_icons/head_button_icon14.svg',
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                      ),
                        SizedBox(height: 8),
                        Text('ข้อเท้า', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
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
                      backgroundColor: const Color.fromARGB(255, 10, 41, 239),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  FootScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        SvgPicture.asset(
                                        'assets/svg_icons/head_button_icon16.svg',
                                        width: 60,
                                        height: 60,
                                        color: Colors.white,
                                      ),
                        SizedBox(height: 8),
                        Text('เท้า', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(height: 24), // Extra bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
