import 'package:flutter/material.dart';
import 'package:rehab2024/StaticDatabaseHelper.dart';


class AddDeleteExercisePage extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const AddDeleteExercisePage({super.key, required this.changeLanguage});

  @override
  _AddDeleteExercisePageState createState() => _AddDeleteExercisePageState();
}

class _AddDeleteExercisePageState extends State<AddDeleteExercisePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _anatomyController = TextEditingController();
   
  List<Map<String, dynamic>> exercises = [];

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  Future<void> _loadExercises() async {
    final db = await StaticDatabaseHelper.instance.database;
    final data = await db.query('exercises');
    setState(() {
      exercises = data;
    });
  }

  Future<void> _addExercise() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> newExercise = {
        'name': _nameController.text,
        'type': 'F', // Default type
        'side': 'All', // Default side
        'anatomy': _anatomyController.text,
        'symptom': null,
        'holdFor': 10,
        'repeatFor': 10,
        'doPerDay': 3,
        'isChecked': 0,
        'isFavorite': 0,
        'image': '',
        'description': '',
      };
      await StaticDatabaseHelper.instance.addNewExercise(newExercise);
      _nameController.clear();
      _anatomyController.clear();
      _loadExercises();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ Exercise added successfully!')),
      );
    }
  }

  Future<void> _deleteExercise(int id) async {
    final db = await StaticDatabaseHelper.instance.database;
    await db.delete(
      'exercises',
      where: 'id = ?',
      whereArgs: [id],
    );
    _loadExercises();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('✅ Exercise deleted successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add & Delete Exercises')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Form to add new exercise
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Exercise Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _anatomyController,
                    decoration: InputDecoration(
                      labelText: 'Anatomy',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an anatomy part';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _addExercise,
                    child: Text('Add Exercise'),
                  ),
                ],
              ),
            ),
            Divider(height: 20, thickness: 1),
            // List of exercises
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final exercise = exercises[index];
                  return ListTile(
                    title: Text(exercise['name']),
                    subtitle: Text('Anatomy: ${exercise['anatomy']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteExercise(exercise['id']),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
