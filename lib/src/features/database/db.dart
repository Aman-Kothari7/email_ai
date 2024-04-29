import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../core/models/my_email_model.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'myEmail.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE myEmail (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, description TEXT NOT NULL, addedDate TEXT NOT NULL)",
    );
  }

  Future<MyEmailModel> insert(MyEmailModel myEmailModel) async {
    var dbClient = await db;
    await dbClient!.insert('myEmail', myEmailModel.toMap());
    final List<Map<String, Object?>> queryResult = await dbClient.query('myEmail');
    var data = queryResult.map((e) => MyEmailModel.fromMap(e)).toList().last;
    myEmailModel.id = data.id;
    return myEmailModel;
  }

  Future<List<MyEmailModel>> getMyEmailList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult = await dbClient!.query('myEmail');
    return queryResult.map((e) => MyEmailModel.fromMap(e)).toList();
  }

  // Future deleteTableContent() async {
  //   var dbClient = await db;
  //   return await dbClient!.delete(
  //     'myEmail',
  //   );
  // }

  Future<int> updateMyEmail(MyEmailModel myEmailModel) async {
    var dbClient = await db;
    return await dbClient!.update(
      'myEmail',
      myEmailModel.toMap(),
      where: 'id = ?',
      whereArgs: [myEmailModel.id],
    );
  }

  Future<int> deleteMyEmail(int id) async {
    var dbClient = await db;
    return await dbClient!.delete(
      'myEmail',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient!.close();
  }
}
