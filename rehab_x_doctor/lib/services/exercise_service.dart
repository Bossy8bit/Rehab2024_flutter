import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../models/exercise.dart';

class ExerciseService {
  static const String databaseName = 'UserManager.db';
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      final Directory appSupportDir = await getApplicationSupportDirectory();
      final String databasesPath = join(appSupportDir.path, 'databases');
      final Directory dbDirectory = Directory(databasesPath);
      if (!await dbDirectory.exists()) {
        await dbDirectory.create(recursive: true);
      }
      path = join(databasesPath, databaseName);
    } else {
      String databasesPath = await getDatabasesPath();
      path = join(databasesPath, databaseName);
    }

    // Ensure the directory exists before copying the database
    final directory = Directory(dirname(path));
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    // Check if the database exists
    bool databaseExists = await databaseExistsFile(path);

    if (!databaseExists) {
      // Copy from asset
      ByteData data = await rootBundle.load('assets/UserManager.db');
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    }

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      return databaseFactoryFfi.openDatabase(path);
    } else {
      return openDatabase(path);
    }
  }

  // Custom function to check database existence as sqflite.databaseExists is deprecated
  Future<bool> databaseExistsFile(String path) async {
    return await File(path).exists();
  }

  Future<List<Exercise>> getExercises() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('EXERCISE_TABLE');
    return List.generate(maps.length, (i) {
      return Exercise.fromMap(maps[i]);
    });
  }

  Future<Exercise?> getExerciseById(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'EXERCISE_TABLE',
      where: 'exer_ID = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Exercise.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<Exercise?> getExerciseFromQR(String qrData) async {
    List<String> parts = qrData.split(',');
    if (parts.isNotEmpty) {
      String exerciseId = parts[0].trim();
      return await getExerciseById(exerciseId);
    }
    return null;
  }
} 