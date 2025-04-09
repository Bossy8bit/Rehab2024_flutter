// import 'package:flutter/material.dart';
// import 'package:rehab2024/DatabaseHelper.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'CustomScaffold.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class AddCardPage extends StatefulWidget {
//   final Function(Locale) changeLanguage;

//   AddCardPage({required this.changeLanguage});

//   @override
//   _AddCardPageState createState() => _AddCardPageState();
// }

// class _AddCardPageState extends State<AddCardPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   String? _selectedImage;
//   String _selectedType = 'S'; // Default type (Stretch)
//   String _selectedSide = 'All'; // Default side
//   String _selectedAnatomy = 'General'; // Default anatomy
//   String _selectedSymptom = 'None'; // Default symptom
//   bool _isFavorite = false;
//   bool _isChecked = false;
//   int _holdFor = 30;
//   int _repeatFor = 3;
//   int _doPerDay = 2;

//   /// Save new exercise to SQLite
//   Future<void> _saveCard() async {
//     if (_formKey.currentState!.validate()) {
//       final newExercise = {
//         'name': _nameController.text,
//         'image': _selectedImage, // Optional image
//         'isFavorite': _isFavorite ? 1 : 0,
//         'isChecked': _isChecked ? 1 : 0,
//         'type': _selectedType,
//         'side': _selectedSide,
//         'anatomy': _selectedAnatomy,
//         'symptom': _selectedSymptom,
//         'holdFor': _holdFor,
//         'repeatFor': _repeatFor,
//         'doPerDay': _doPerDay,
//       };

//       await DatabaseHelper.instance.insertExercise(newExercise);

//       _showSuccessPopup();
//     }
//   }

//   /// Show success pop-up
//   void _showSuccessPopup() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Success'),
//           content: Text('Exercise added successfully!'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context); // Close pop-up
//                 Navigator.pop(context, true); // Go back to previous screen
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       changeLanguage: widget.changeLanguage,
//       appBar: AppBar(
//         title: Text('Add New Exercise'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               // Exercise Name Input
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Exercise Name',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.fitness_center),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),

//               // Type Selection (Stretch / Strengthen)
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   labelText: 'Type',
//                   border: OutlineInputBorder(),
//                 ),
//                 value: _selectedType,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedType = newValue!;
//                   });
//                 },
//                 items: ['S', 'F']
//                     .map((type) => DropdownMenuItem(value: type, child: Text(type == 'S' ? 'Stretch' : 'Strengthen')))
//                     .toList(),
//               ),
//               SizedBox(height: 16),

//               // Side Selection (Left / Right / All)
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   labelText: 'Side',
//                   border: OutlineInputBorder(),
//                 ),
//                 value: _selectedSide,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedSide = newValue!;
//                   });
//                 },
//                 items: ['Left', 'Right', 'All']
//                     .map((side) => DropdownMenuItem(value: side, child: Text(side)))
//                     .toList(),
//               ),
//               SizedBox(height: 16),

//               // Anatomy Selection
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   labelText: 'Anatomy',
//                   border: OutlineInputBorder(),
//                 ),
//                 value: _selectedAnatomy,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedAnatomy = newValue!;
//                   });
//                 },
//                 items: ['General', 'Hamstring', 'Shoulder', 'Back']
//                     .map((anatomy) => DropdownMenuItem(value: anatomy, child: Text(anatomy)))
//                     .toList(),
//               ),
//               SizedBox(height: 16),

//               // Symptom Selection
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   labelText: 'Symptom',
//                   border: OutlineInputBorder(),
//                 ),
//                 value: _selectedSymptom,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedSymptom = newValue!;
//                   });
//                 },
//                 items: ['None', 'Pain', 'Stiffness', 'Weakness']
//                     .map((symptom) => DropdownMenuItem(value: symptom, child: Text(symptom)))
//                     .toList(),
//               ),
//               SizedBox(height: 16),

//               // // Image Selection
//               // DropdownButtonFormField<String>(
//               //   decoration: InputDecoration(
//               //     labelText: 'Select Image (Optional)',
//               //     border: OutlineInputBorder(),
//               //     prefixIcon: Icon(Icons.image),
//               //   ),
//               //   value: _selectedImage,
//               //   onChanged: (newValue) {
//               //     setState(() {
//               //       _selectedImage = newValue!;
//               //     });
//               //   },
//               //   items: ['lib/assets/svg_icons/appicon.svg'].map((imagePath) {
//               //     return DropdownMenuItem(
//               //       value: imagePath,
//               //       child: Row(
//               //         children: [
//               //           SvgPicture.asset(imagePath, width: 50, height: 50), // Use flutter_svg
//               //           SizedBox(width: 10),
//               //           Text(imagePath.split('/').last),
//               //         ],
//               //       ),
//               //     );
//               //   }).toList(),
//               // ),
//               // SizedBox(height: 16),

//               // Favorite Checkbox
//               CheckboxListTile(
//                 title: Text('Mark as Favorite'),
//                 value: _isFavorite,
//                 onChanged: (value) {
//                   setState(() {
//                     _isFavorite = value!;
//                   });
//                 },
//                 controlAffinity: ListTileControlAffinity.leading,
//               ),

//               // Checked Checkbox
//               CheckboxListTile(
//                 title: Text('Mark as Checked'),
//                 value: _isChecked,
//                 onChanged: (value) {
//                   setState(() {
//                     _isChecked = value!;
//                   });
//                 },
//                 controlAffinity: ListTileControlAffinity.leading,
//               ),
//               SizedBox(height: 16),

//               // Save Button
//               ElevatedButton(
//                 onPressed: _saveCard,
//                 child: Text('Save Exercise'),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 50),
//                   textStyle: TextStyle(fontSize: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
