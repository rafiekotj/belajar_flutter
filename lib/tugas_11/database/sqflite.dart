import 'package:belajar_flutter/tugas_11/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'my_rentora.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
        );
        await db.execute(
          'CREATE TABLE siswa (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, kelas TEXT)',
        );
        await db.execute(
          'CREATE TABLE pengguna (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, email TEXT, phone TEXT, city TEXT)',
        );
      },
      version: 3,
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < 3) {
          db.execute(
            'CREATE TABLE pengguna (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, email TEXT, phone TEXT, city TEXT)',
          );
        }
      },
    );
  }

  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    await dbs.insert('user', user.toMap());
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(
      "user",
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }
}
