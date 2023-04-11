import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperSearch {
  static const _dbName = 'search_ads.db';
  static const _dbVersion = 1;
  static const _tableName = 'searchTable';
  static const columnId = '_id';
  static const categoryName = '_categoryName';
  static const region = '_region';
  static const selectionCriteria = '_selectionCriteria';
  static const postalCode = '_postalCode';
  static const searchText = '_searchText';
  static const searchInTitle = '_searchInTitle';
  static const urgentsAds = '_urgentsAds';
  static const withPhotos = '_withPhotos';
  static const columnName = 'idColumn';
  static Database? _database;

  DatabaseHelperSearch._privateConstructor();
  static final DatabaseHelperSearch instance =
      DatabaseHelperSearch._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    return db.execute('''
        CREATE TABLE $_tableName ($columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL, 
      $categoryName TEXT, 
      $region TEXT, 
      $selectionCriteria TEXT, 
      $postalCode TEXT, 
      $searchText TEXT,
      $searchInTitle BOOl,
      $urgentsAds BOOL,
      $withPhotos BOOL
       )
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database? db = await instance.database;
    return await db!.rawQuery('SELECT * FROM $_tableName');
  }

  Future update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!
        .update(_tableName, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete() async {
    Database? db = await instance.database;
    return await db!.delete(_tableName);
  }
}
