import 'dart:async';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


//studentdatabase page
class StudentDatabase {
  static Future<Database> _openDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "student_db.db");
    return openDatabase(path, version: 1, onCreate: _createDb);
  }

  static FutureOr<void> _createDb(Database db, int version) async {
    await db.execute('''CREATE TABLE student (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      age INTEGER,
      contact TEXT,
      bloodgroup TEXT,
      address TEXT,
      division TEXT,
      image TEXT
      )''');
  }

  static Future<int> insertStudent({
    required String name,
    required int age,
    required String contact,
    required String bloodgroup,
    required String address,
    required String division,
    required Uint8List imageBytes,
  }) async {
    final db = await _openDb();
    final data = {
      'name': name,
      'age': age,
      'contact': contact,
      'bloodgroup': bloodgroup,
      'address': address,
      'division': division,
      'image': imageBytes,
    };
    return await db.insert('student', data);
  }

  static Future<int> deleteData(int id) async {
    final db = await _openDb();
    return await db.delete('student', where: 'id=?', whereArgs: [id]);
  }

  static Future<int> updateData(int id, Map<String, dynamic> data) async {
    final db = await _openDb();
    return await db.update('student', data, where: 'id=?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getAllStudents() async {
    final db = await _openDb();
    return db.query('student');
  }

  static Future<void> clearDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "student_db.db");
    await deleteDatabase(path);
  }
}
