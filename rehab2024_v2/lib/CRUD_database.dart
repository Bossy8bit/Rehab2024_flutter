import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class CRUDDatabaseHelper {
  // Singleton instance
  static final CRUDDatabaseHelper instance = CRUDDatabaseHelper._internal();
  CRUDDatabaseHelper._internal(); // Private constructor

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'rehab2024.db');

    return await openDatabase(
      path,
      version: 2, // 🔹 Increase when modifying the schema
      onCreate: (db, version) async {
        await db.execute(_createTableQuery());
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute("ALTER TABLE exercises ADD COLUMN description TEXT DEFAULT ''");
        }
      },
    );
  }

  /// SQL query for creating the table
  String _createTableQuery() {
    return '''
      CREATE TABLE IF NOT EXISTS exercises (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        type TEXT CHECK (type IN ('S', 'F')) NOT NULL, 
        side TEXT CHECK (side IN ('Left', 'Right', 'All')) NOT NULL, 
        anatomy TEXT CHECK (anatomy IN ('neck', 'shoulder', 'arm', 'back', 'hip', 'knee', 'ankle', 'foot')) DEFAULT NULL, 
        symptom TEXT CHECK (symptom IN ('OA_knee', 'frozen_shoulder', 'Low_back_pain')) DEFAULT NULL, 
        holdFor INTEGER  DEFAULT 0 NOT NULL,
        repeatFor INTEGER  DEFAULT 0 NOT NULL,
        doPerDay INTEGER  DEFAULT 0 NOT NULL,
        isChecked INTEGER DEFAULT 0 NOT NULL, 
        isFavorite INTEGER DEFAULT 0 NOT NULL,
        description TEXT DEFAULT ''
      )
    ''';
  }

  /// Insert a new exercise into the database
  Future<int> insertExercise(Map<String, dynamic> exercise) async {
    try {
      Database db = await database;
      return await db.insert('exercises', exercise);
    } catch (e) {
      print("❌ Error inserting exercise: $e");
      return -1;
    }
  }

  /// Fetch all exercises
  Future<List<Map<String, dynamic>>> fetchAllExercises() async {
    try {
      Database db = await database;
      return await db.query('exercises');
    } catch (e) {
      print("❌ Error fetching exercises: $e");
      return [];
    }
  }

  /// Update favorite status
  Future<int> updateFavoriteStatus(int id, int isFavorite) async {
    try {
      Database db = await database;
      return await db.update(
        'exercises',
        {'isFavorite': isFavorite},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print("❌ Error updating favorite status: $e");
      return -1;
    }
  }
  /// Fetch only favorite exercises from the database
Future<List<Map<String, dynamic>>> fetchFavoriteExercises() async {
  try {
    Database db = await database;
    return await db.query(
      'exercises', 
      where: 'isFavorite = ?', 
      whereArgs: [1]  // ✅ Fetch only where isFavorite = 1
    );
  } catch (e) {
    print("❌ Error fetching favorite exercises: $e");
    return []; // Return empty list if error occurs
  }
}

  /// Update checked status
  Future<int> updateCheckedStatus(int id, int isChecked) async {
    try {
      Database db = await database;
      return await db.update(
        'exercises',
        {'isChecked': isChecked},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print("❌ Error updating checked status: $e");
      return -1;
    }
  }

  /// Delete an exercise
  Future<int> deleteExercise(int id) async {
    try {
      Database db = await database;
      return await db.delete('exercises', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print("❌ Error deleting exercise: $e");
      return -1;
    }
  }

  /// Delete entire database (for debugging)
  Future<void> deleteDatabaseFile() async {
    try {
      String path = join(await getDatabasesPath(), 'rehab2024.db');
      await deleteDatabase(path);
      print("✅ Database deleted successfully.");
    } catch (e) {
      print("❌ Error deleting database: $e");
    }
  }
}

