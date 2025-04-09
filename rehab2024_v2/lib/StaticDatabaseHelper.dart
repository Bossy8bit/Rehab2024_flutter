import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StaticDatabaseHelper {
  static final StaticDatabaseHelper instance = StaticDatabaseHelper._internal();
  StaticDatabaseHelper._internal();

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
      version: 1,
      onCreate: (db, version) async {
        await _createTable(db);
        await _populateTable(db);
      },
    );
  }
  Future<List<Map<String, dynamic>>> fetchFavoriteExercises() async {
  try {
    final db = await database; // Ensure the database is properly initialized
    return await db.query(
      'exercises',
      where: 'isFavorite = ?', // Query only favorite exercises
      whereArgs: [1],
    );
  } catch (e) {
    print('❌ Error fetching favorite exercises: $e');
    return []; // Return an empty list if an error occurs
  }
}
Future<void> addNewExercise(Map<String, dynamic> exercise) async {
  final db = await StaticDatabaseHelper.instance.database;
  await db.insert('exercises', exercise);
  print("✅ New exercise added: ${exercise['name']}");
}


  /// Define the schema
  Future<void> _createTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS exercises (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        type TEXT CHECK (type IN ('S', 'F')) NOT NULL, 
        side TEXT CHECK (side IN ('Left', 'Right', 'All')) NOT NULL, 
        anatomy TEXT CHECK (anatomy IN ('neck', 'shoulder', 'arm', 'back', 'hip', 'knee', 'ankle', 'foot')) DEFAULT NULL, 
        symptom TEXT CHECK (symptom IN ('OA_knee', 'frozen_shoulder', 'Low_back_pain')) DEFAULT NULL, 
        holdFor INTEGER DEFAULT 0 NOT NULL,
        repeatFor INTEGER DEFAULT 0 NOT NULL,
        doPerDay INTEGER DEFAULT 0 NOT NULL,
        isChecked INTEGER DEFAULT 0 NOT NULL,
        isFavorite INTEGER DEFAULT 0 NOT NULL,
        image TEXT,
        description TEXT DEFAULT ''
      )
    ''');
    print("✅ Table created.");
  }
  
  Future<void> _populateTable(Database db) async {
  for (var exercise in exercises) {
    await db.insert('exercises', exercise);
  }
  print("✅ Exercises populated.");
}

  final exercises = [
  {
    'name': 'Stretching left splenius muscle',
    'type': 'F',
    'side': 'Left',
    'anatomy': 'neck',
    'symptom': null,
    'holdFor': 10,
    'repeatFor': 10,
    'doPerDay': 3,
    'isChecked': 0,
    'isFavorite': 0,
    'image': '',
    'description': '',
  },
  {
    'name': 'Stretching left upper trapezius muscle ท่า 1',
    'type': 'F',
    'side': 'Left',
    'anatomy': 'shoulder',
    'symptom': null,
    'holdFor': 10,
    'repeatFor': 10,
    'doPerDay': 3,
    'isChecked': 0,
    'isFavorite': 0,
    'image': '',
    'description': '',
  },
  {
    'name': 'Stretching left upper trapezius muscle ท่า 2',
    'type': 'F',
    'side': 'Left',
    'anatomy': 'shoulder',
    'symptom': null,
    'holdFor': 10,
    'repeatFor': 10,
    'doPerDay': 3,
    'isChecked': 0,
    'isFavorite': 0,
    'image': '',
    'description': '',
  },
  {
    'name': 'Stretching left levator scapulae muscle',
    'type': 'F',
    'side': 'Left',
    'anatomy': 'shoulder',
    'symptom': null,
    'holdFor': 10,
    'repeatFor': 10,
    'doPerDay': 3,
    'isChecked': 0,
    'isFavorite': 0,
    'image': '',
    'description': '',
  },
  {
    'name': 'Stretching left pectoralis major muscle',
    'type': 'F',
    'side': 'Left',
    'anatomy': 'shoulder',
    'symptom': null,
    'holdFor': 10,
    'repeatFor': 10,
    'doPerDay': 3,
    'isChecked': 0,
    'isFavorite': 0,
    'image': '',
    'description': '',
  },
  {
    'name': 'Stretching left quadratus lumborum muscle ท่า 1',
    'type': 'F',
    'side': 'Left',
    'anatomy': 'back',
    'symptom': null,
    'holdFor': 10,
    'repeatFor': 10,
    'doPerDay': 3,
    'isChecked': 0,
    'isFavorite': 0,
    'image': '',
    'description': '',
  },
  {
    'name': 'Stretching left quadratus lumborum muscle ท่า 2',
    'type': 'F',
    'side': 'Left',
    'anatomy': 'back',
    'symptom': null,
    'holdFor': 10,
    'repeatFor': 10,
    'doPerDay': 3,
    'isChecked': 0,
    'isFavorite': 0,
    'image': '',
    'description': '',
  },
  {
    'name': 'Stretching left quadratus lumborum muscle ท่า 3',
    'type': 'F',
    'side': 'Left',
    'anatomy': 'back',
    'symptom': null,
    'holdFor': 10,
    'repeatFor': 10,
    'doPerDay': 3,
    'isChecked': 0,
    'isFavorite': 0,
    'image': '',
    'description': '',
  },
  {
    'name': 'Stretching left gluteus maximus muscle ท่า 1',
    'type': 'F',
    'side': 'Left',
    'anatomy': 'hip',
    'symptom': null,
    'holdFor': 10,
    'repeatFor': 10,
    'doPerDay': 3,
    'isChecked': 0,
    'isFavorite': 0,
    'image': '',
    'description': '',
  },
  {
    'name': 'Stretching left gluteus maximus muscle ท่า 2',
    'type': 'F',
    'side': 'Left',
    'anatomy': 'hip',
    'symptom': null,
    'holdFor': 10,
    'repeatFor': 10,
    'doPerDay': 3,
    'isChecked': 0,
    'isFavorite': 0,
    'image': '',
    'description': '',
  },
  {
    'name': 'Stretching left gluteus maximus muscle ท่า 3',
    'type': 'F',
    'side': 'Left',
    'anatomy': 'hip',
    'symptom': null,
    'holdFor': 10,
    'repeatFor': 10,
    'doPerDay': 3,
    'isChecked': 0,
    'isFavorite': 0,
    'image': '',
    'description': '',
  },
  {
    'name': 'Stretching left hip flexor muscle',
    'type': 'F',
    'side': 'Left',
    'anatomy': 'hip',
    'symptom': null,
    'holdFor': 10,
    'repeatFor': 10,
    'doPerDay': 3,
    'isChecked': 0,
    'isFavorite': 0,
    'image': '',
    'description': '',
  },
    {
    'name': 'หลัง left hip flexor muscle',
    'type': 'F',
    'side': 'Left',
    'anatomy': 'hip',
    'symptom': null,
    'holdFor': 10,
    'repeatFor': 10,
    'doPerDay': 3,
    'isChecked': 0,
    'isFavorite': 0,
    'image': '',
    'description': '',
  },
  // Add other items in the same format
];


    
}

