import 'package:belajar_flutter/tugas_11/database/sqflite.dart';
import 'package:belajar_flutter/tugas_11/models/pengguna_model.dart';

class PenggunaController {
  static Future<void> registerPengguna(PenggunaModel pengguna) async {
    final dbs = await DBHelper.db();
    await dbs.insert('pengguna', pengguna.toMap());
    print(pengguna.toMap());
  }

  static Future<List<PenggunaModel>> getAllPengguna() async {
    final dbs = await DBHelper.db();
    final List<Map<String, dynamic>> results = await dbs.query('pengguna');
    print(results.map((e) => PenggunaModel.fromMap(e)).toList());
    return results.map((e) => PenggunaModel.fromMap(e)).toList();
  }

  static Future<int> updatePengguna(PenggunaModel pengguna) async {
    final dbs = await DBHelper.db();
    if (pengguna.id == null) {
      throw Exception("ID Wajid ada");
    }
    return dbs.update(
      'pengguna',
      pengguna.toMap(),
      where: 'id = ?',
      whereArgs: [pengguna.id],
    );
  }

  static Future<int> deletePengguna(int id) async {
    final dbs = await DBHelper.db();
    return dbs.delete('pengguna', where: 'id = ?', whereArgs: [id]);
  }
}
