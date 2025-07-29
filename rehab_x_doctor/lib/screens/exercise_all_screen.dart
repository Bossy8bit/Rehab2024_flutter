// import 'package:flutter/material.dart';
// import 'package:rehab_x_patient/screens/exercise_list_screen.dart';
// import 'exercise_bybody_screen.dart';
// import 'exercise_bysymptom_screen.dart';
// import 'exercise_details_screen.dart';
// import 'qr_scanner_screen.dart';
// import '../models/exercise.dart';
// import '../services/exercise_service.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ExerciseAllScreen extends StatefulWidget {
//   const ExerciseAllScreen({super.key});

//   @override
//   State<ExerciseAllScreen> createState() => _ExerciseAllScreenState();
// }

// class _ExerciseAllScreenState extends State<ExerciseAllScreen> {

//   List<Exercise> _exercises = [];
 

//   @override
//   void initState() {
//     super.initState();
//   ;
//   }

 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Rehab X', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const QRScannerScreen(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,//remove space under container 
//               children: [
//                 SizedBox(height: 16),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 120,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.lightBlueAccent,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                       elevation: 4,
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const ExerciseListScreen()),
//                       );
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset(
//                                         'assets/svg_icons/Magnifying glasss.svg',
//                                         width: 60,
//                                         height: 60,
//                                         color: Colors.white,
//                                       ),
//                         const SizedBox(height: 8),
//                         const Text('รายการท่าทั้งหมด', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
              
//                 SizedBox(
//                   width: double.infinity,
//                   height: 120,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.tealAccent,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                       elevation: 4,
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) =>  ExerciseByBodyScreen()),
//                       );
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children:  [
//                         SvgPicture.asset(
//                                         'assets/svg_icons/head_button_icon7.svg',
//                                         width: 60,
//                                         height: 60,
//                                         color: Colors.white,
//                                       ),
//                         SizedBox(height: 8),
//                         Text('ตามส่วนร่างกาย', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 SizedBox(
//                   width: double.infinity,
//                   height: 120,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 10, 41, 239),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                       elevation: 4,
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const ExerciseBySymptomScreen()),
//                       );
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children:  [
//                         SvgPicture.asset(
//                                         'assets/svg_icons/head_button_icon6.svg',
//                                         width: 60,
//                                         height: 60,
//                                         color: Colors.white,
//                                       ),
//                         SizedBox(height: 8),
//                         Text('ตามกลุ่มอาการ', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                   ),
//                 ),
                
//                 // const SizedBox(height: 24), // Extra bottom padding
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

  
// }
