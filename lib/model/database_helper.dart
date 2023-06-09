import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trocbuy/model/ad.dart';

class DatabaseHelper {
  static const _dbName = 'favorite_ads.db';
  static const _dbVersion = 1;
  static const _tableName = 'adIdTable';
  static const columnId = '_id';
  static const columnName = 'favorites';
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
    int count = 0;
    try {
      Database? db = await instance.database2;
      count = await db!.insert(_tableName, {columnName: jsonEncode(row)}).then(
        (value) {
          if (kDebugMode) {
            print('>>>>>>> Inserted {'
                'value:$value'
                'ad:${row["id_ad"]}');
          }
          return value;
        },
      );
    } catch (exception, trace) {
      if (kDebugMode) {
        print(exception);
        print(trace);
      }
    }
    return count;
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database? db = await instance.database2;
    return await db!.rawQuery('SELECT $columnName FROM $_tableName');
  }

  Future update(Map<String, dynamic> row) async {
    Database? db = await instance.database2;
    int id = row[columnId];
    return await db!
        .update(_tableName, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(Ad ad) async {
    int rows = 0;
    try {
      Database? db = await instance.database2;
      rows = await db!.delete(_tableName,
          where: '$columnName=?', whereArgs: [jsonEncode(ad.toJson())]);
    } catch (exception, trace) {
      if (kDebugMode) {
        print(exception);
        print(trace);
      }
    }
    return rows;
  }

  Future<int> deleteAll() async {
    Database? db = await instance.database2;
    return await db!.delete(_tableName);
  }
}
