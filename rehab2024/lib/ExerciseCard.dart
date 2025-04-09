

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rehab2024/main.dart';
import 'CustomScaffold.dart';


class ExerciseCardScreen extends StatefulWidget {
  final Function(Locale) changeLanguage;

  ExerciseCardScreen({required this.changeLanguage});
  
  @override
  _ExerciseCardScreenState createState() => _ExerciseCardScreenState();

}

class _ExerciseCardScreenState extends State<ExerciseCardScreen> {
  late Box<Exercise> box;
  List<Exercise> allExercises = [];
  List<Exercise> filteredExercises = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    box = Hive.box('exerciseBox');
    loadExercises();
  }

  void loadExercises() {
    setState(() {
      allExercises = box.values.toList().cast<Exercise>();
      filteredExercises = allExercises;
    });
  }

  void searchExercises(String query) {
    setState(() {
      filteredExercises = allExercises
          .where((exercise) => exercise.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  Widget _buildExerciseImage(String? imagePath) {
  if (imagePath == null || imagePath.isEmpty) {
    return Icon(Icons.image_not_supported, size: 200, color: Colors.grey); // Default icon when image is missing
  }

  return Image.asset(
    imagePath,
    height: 250,
    width: 200,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) {
      return Icon(Icons.broken_image, size: 100, color: Colors.grey); // Fallback icon if the image path is invalid
    },
  );
}

  @override
  Widget build(BuildContext context) {
    
    return CustomScaffold(
      changeLanguage: widget.changeLanguage,
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: searchController,
              onChanged: searchExercises,
              decoration: InputDecoration(
                labelText: "Search Exercise",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredExercises.length,
              itemBuilder: (context, index) {
                var exercise = filteredExercises[index];

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
                      children: [
                        // ✅ Left Side: Image (fixed size)
                        Container(
                          width: 100, // Fixed width for consistency
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: _buildExerciseImage(exercise.imagePath), // Calls function to display image or icon
                        ),
                        SizedBox(width: 15), // Space between image and text

                        // ✅ Right Side: Text Details
                        Expanded(
                          flex: 2, // Allows text to take up remaining space
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
                            children: [
                              Text(
                                exercise.name,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 2, // Prevents overflow
                                overflow: TextOverflow.ellipsis,
                              ),
                              Divider(),
                              _infoRow("Type", exercise.type),
                              _infoRow("Side", exercise.side),
                              _infoRow("Anatomy", exercise.anatomy),
                              _infoRow("Symptom", exercise.symptom),
                              _infoRow("Hold Time", "${exercise.holdFor} sec"),
                              _infoRow("Repeat", "${exercise.repeatFor} times"),
                              _infoRow("Per Day", "${exercise.doPerDay} times/day"),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // child: Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     // Left Side: Text Details
                    //     Expanded(
                    //       flex: 2,
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             exercise.name,
                    //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    //           ),
                    //           Divider(),
                    //           _infoRow("Type", exercise.type),
                    //           _infoRow("Side", exercise.side),
                    //           _infoRow("Anatomy", exercise.anatomy),
                    //           _infoRow("Symptom", exercise.symptom),
                    //           _infoRow("Hold Time", "${exercise.holdFor} sec"),
                    //           _infoRow("Repeat", "${exercise.repeatFor} times"),
                    //           _infoRow("Per Day", "${exercise.doPerDay} times/day"),
                    //         ],
                    //       ),
                    //     ),
                    //     SizedBox(width: 10),
                    //     // Right Side: Image
                    //     ClipRRect(
                    //       borderRadius: BorderRadius.circular(10),
                    //       child: _buildExerciseImage(exercise.imagePath),
                    //     ),
                    //   ],
                    // ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text("$label: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}