import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'CustomScaffold.dart';

class PatientListSearch extends StatelessWidget {
  final Function(Locale) changeLanguage;

  const PatientListSearch({super.key, required this.changeLanguage});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      changeLanguage: changeLanguage,
      appBar: AppBar(
        title: const Text('Exercise List'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.tealAccent,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: AppLocalizations.of(context)!.searchwithHNorName
                    // 'Search with HN or name-surname'
                    ,
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.noExerciseAvailable
                      //"No exercises available"
                      ,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                // Handle adding a new exercise
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
