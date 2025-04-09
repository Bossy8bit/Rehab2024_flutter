import 'package:flutter/material.dart';
import 'package:rehab2024/StaticDatabaseHelper.dart';
import 'CustomScaffold.dart';

class FavoritesPage extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const FavoritesPage({super.key, required this.changeLanguage});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Map<String, dynamic>> _favoriteExercises = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  /// Fetch favorite exercises from SQLite database
  Future<void> _loadFavorites() async {
    final data = await StaticDatabaseHelper.instance.fetchFavoriteExercises();
    setState(() {
      _favoriteExercises = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      changeLanguage: widget.changeLanguage,
      appBar: AppBar(
        title: const Text("Favorite Exercises"),
        backgroundColor: Colors.blue,
      ),
      body: _favoriteExercises.isEmpty
          ? const Center(
              child: Text(
                "No favorites yet.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: _favoriteExercises.length,
              itemBuilder: (context, index) {
                final exercise = _favoriteExercises[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: exercise['image'] != null && exercise['image'].isNotEmpty
                        ? Image.asset(
                            exercise['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.image_not_supported, size: 50),
                    title: Text(
                      exercise['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${exercise['type'] == 'S' ? 'Stretch' : 'Strengthen'} • ${exercise['side']} • ${exercise['anatomy']}",
                    ),
                    trailing: const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
