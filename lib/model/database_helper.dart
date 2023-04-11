import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _dbName = 'favorite_ads.db';
  static final _dbVersion = 1;
  static final _tableName = 'adIdTable';
  static final columnId = '_id';
  static final columnName = 'idColumn';
  static Database? _database2;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database?> get database2 async {
    if (_database2 != null) return _database2;

    _database2 = await _initiateDatabase();
    return _database2;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    return db.execute('''
        CREATE TABLE $_tableName ($columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL )
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database2;
    return await db!.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database? db = await instance.database2;
    return await db!.rawQuery('SELECT * FROM $_tableName');
  }

  Future update(Map<String, dynamic> row) async {
    Database? db = await instance.database2;
    int id = row[columnId];
    return await db!
        .update(_tableName, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(String idAd) async {
    Database? db = await instance.database2;
    return await db!
        .delete(_tableName, where: '$columnName=?', whereArgs: [idAd]);
  }

  Future<int> deleteAll() async {
    Database? db = await instance.database2;
    return await db!.delete(_tableName);
  }
}
