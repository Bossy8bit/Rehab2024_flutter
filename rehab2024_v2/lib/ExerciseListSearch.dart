import 'package:flutter/material.dart';
import 'package:rehab2024/CustomScaffold.dart';
import 'package:rehab2024/StaticDatabaseHelper.dart';
import 'dart:async';

class ExerciseListSearch extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const ExerciseListSearch({super.key, required this.changeLanguage});

  @override
  _ExerciseListSearchState createState() => _ExerciseListSearchState();
}

class _ExerciseListSearchState extends State<ExerciseListSearch> {
  List<Map<String, dynamic>> exercises = [];
  List<Map<String, dynamic>> filteredExercises = [];
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    fetchExercises();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchExercises(); // Ensure data refresh when navigating back
  }

  /// Fetch exercises from the static database
  Future<void> fetchExercises() async {
    try {
      final db = await StaticDatabaseHelper.instance.database;
      final data = await db.query('exercises'); // Fetch all exercises
      setState(() {
        exercises = data;
        filteredExercises = data;
      });
    } catch (error) {
      print("❌ Error fetching exercises: $error");
    }
  }
  
  Future<void> addNewExercise(Map<String, dynamic> exercise) async {
  final db = await StaticDatabaseHelper.instance.database;
  await db.insert('exercises', exercise);
  print("✅ New exercise added: ${exercise['name']}");
  }

  /// Handles search with debouncing
  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        if (searchController.text.isEmpty) {
          filteredExercises = exercises;
        } else {
          filteredExercises = exercises
              .where((exercise) =>
                  exercise['name'].toLowerCase().contains(searchController.text.toLowerCase()))
              .toList();
        }
      });
    });
  }

  /// Toggle favorite status
  Future<void> toggleFavorite(int id, bool isFavorite) async {
    try {
      final db = await StaticDatabaseHelper.instance.database;
      await db.update(
        'exercises',
        {'isFavorite': isFavorite ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
      fetchExercises(); // Refresh the list
    } catch (error) {
      print("❌ Error toggling favorite: $error");
    }
  }

  /// Toggle checked status
  Future<void> toggleChecked(int id, bool isChecked) async {
    try {
      final db = await StaticDatabaseHelper.instance.database;
      await db.update(
        'exercises',
        {'isChecked': isChecked ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
      fetchExercises(); // Refresh the list
    } catch (error) {
      print("❌ Error toggling checked status: $error");
    }
  }

  /// Delete an exercise
  Future<void> deleteExercise(int id) async {
    try {
      final db = await StaticDatabaseHelper.instance.database;
      await db.delete('exercises', where: 'id = ?', whereArgs: [id]);
      fetchExercises(); // Refresh the list
    } catch (error) {
      print("❌ Error deleting exercise: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      changeLanguage: widget.changeLanguage,
      appBar: AppBar(),
      body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              hintText: "Search",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: filteredExercises.isEmpty
              ? const Center(child: Text("No exercises found"))
              : ListView.builder(
                  itemCount: filteredExercises.length,
                  itemBuilder: (context, index) {
                    final exercise = filteredExercises[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          // Image Section
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: exercise['image'] != null && exercise['image'].isNotEmpty
                                ? Image.asset(
                                    exercise['image'],
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.image_not_supported, size: 80),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exercise['name'],
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  exercise['isFavorite'] == 1 ? Icons.star : Icons.star_border,
                                  color: exercise['isFavorite'] == 1 ? Colors.yellow : Colors.grey,
                                ),
                                onPressed: () {
                                  toggleFavorite(exercise['id'], exercise['isFavorite'] == 0);
                                },
                              ),
                              Checkbox(
                                value: exercise['isChecked'] == 1,
                                onChanged: (value) {
                                  toggleChecked(exercise['id'], value!);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        // Finalize Prescription Button
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            onPressed: () {
              // Finalize Prescription action
              print("Prescription finalized");
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontSize: 16),
              backgroundColor: Colors.blue,
            ),
            child: const Text("Finalize Prescription"),
          ),
        ),
      ],
    ),
  );
}
}