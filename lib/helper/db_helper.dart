import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import '../modal/api_modal.dart';

enum product {
  id,
  title,
  description,
  price,
  discountPercentage,
  rating,
  stock,
  brand,
  category,
  thumbnai,
}

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();
  Logger logger = Logger();
  List<Products> alldata = [];
  String query = '';

  String dbname = 'storage.db';
  String tablename = 'Table';
  late Database database;

  Completer<void> _initCompleter = Completer<void>();

  Future<void> initDB() async {
    if (!_initCompleter.isCompleted) {
      try {
        String path = await getDatabasesPath();
        database = await openDatabase("$path/$Table", version: 1,
            onCreate: (db, version) {
          String query =
              """CREATE TABLE IF NOT EXISTS $Table (${product.id.name} INTEGER PRIMARY KEY AUTOINCREMENT, ${product.title.name} TEXT NOT NULL, ${product.description.name} TEXT NOT NULL, ${product.price.name} INTEGER, ${product.brand.name} INTEGER , ${product.category.name} INTEGER , ${product.discountPercentage.name} INTEGER , ${product.rating.name} INTEGER , ${product.stock.name} INTEGER , ${product.thumbnai.name} INTEGER)""";
          //await db.execute("CREATE TABLE Picture(id INTEGER PRIMARY KEY, title TEXT, picture BLOB )");
          db
              .execute(query)
              .then((value) => logger.i('Table created successfully'))
              .onError((error, stackTrace) => logger.e("Error: $error"));
        });
        _initCompleter.complete();
      } catch (e) {
        _initCompleter.completeError(e);
        logger.e("Database initialization error: $e");
      }
    }
    return _initCompleter.future;
  }

  Future<void> insert({required Products products}) async {
    await initDB();
    try {
      Map<String, dynamic> data = products.todata();
      data.remove('id');
      await database
          .insert(tablename, data)
          .then((value) => logger.i("Record inserted successfully"))
          .onError((error, stackTrace) => logger.e("Error: $error"));
    } catch (e) {
      logger.e("Insert error: $e");
    }
  }

  Future<void> update({required Products products}) async {
    await initDB();
    try {
      await database
          .update(tablename, products.todata(),
              where: "${product.id.name} = ?", whereArgs: [product.id])
          .then(
            (value) => logger.i("Record updated successfully"),
          )
          .onError(
            (error, stackTrace) => logger.e("Error: $error"),
          );
    } catch (e) {
      logger.e("Update error: $e");
    }
  }

  Future<void> delete({required Products products}) async {
    await initDB();
    try {
      await database
          .delete(tablename,
              where: "${product.id.name} = ?", whereArgs: [product.id])
          .then((value) => logger.i("Record deleted successfully"))
          .onError((error, stackTrace) => logger.e("Error: $error"));
    } catch (e) {
      logger.e("Delete error: $e");
    }
  }

  Future<List<Products>> getAlldata() async {
    try {
      query = 'SELECT * FROM $tablename;';
      List<Map<String, dynamic>> data = await database.rawQuery(query);
      logger.t("SELECTED DATA: $data");
      alldata = data.map((e) => Products.fromdata(data: e)).toList();
      logger.t("CONVERTED DATA: $alldata");
      return alldata;
    } catch (e) {
      logger.e("Get all data error: $e");
      return [];
    }
  }

  Future<void> closeDB() async {
    await initDB();
    try {
      await database.close();
      logger.i("Database closed successfully");
    } catch (e) {
      logger.e("Close database error: $e");
    }
  }
}
