import 'package:e_commerce_app/helper/db_helper.dart';
import 'package:flutter/material.dart';
import '../modal/api_modal.dart';

class DdController extends ChangeNotifier {
  List<Products> alldata = [];

  Future<void> initDb() async {
    alldata = await DBHelper.dbHelper.getAlldata();
    notifyListeners();
  }

  Future<void> addInsert({required Products product}) async {
    DBHelper.dbHelper.insert(products: product).then(
          (value) => initDb(),
        );
    notifyListeners();
  }

  Future<void> updateData({required Products product}) async {
    DBHelper.dbHelper.update(products: product).then(
          (value) => initDb(),
        );
    notifyListeners();
  }

  Future<void> deleteData({required Products product}) async {
    DBHelper.dbHelper.delete(products: product).then(
          (value) => initDb(),
        );
    notifyListeners();
  }
}
