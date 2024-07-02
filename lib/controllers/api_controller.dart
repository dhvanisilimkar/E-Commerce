import 'package:e_commerce_app/helper/api_helper.dart';
import 'package:flutter/material.dart';
import '../modal/api_modal.dart';

class ApiController extends ChangeNotifier {
  List<Products> alldata = [];
  List<Products> favorite = [];
  List<Products> cart = [];

  ApiController() {
    get();
  }

  Future<void> get() async {
    print("data :- $alldata");
    alldata = await ApiHelper.apiHelper.get();
    notifyListeners();
  }

  toggleFavorite(Products products) {
    Products productst =
        alldata.firstWhere((element) => element.id == products.id);
    if (favorite.contains(productst)) {
      favorite.remove(productst);
    } else {
      favorite.add(productst);
    }
    notifyListeners();
  }

  Cart(Products products) {
    Products product =
        alldata.firstWhere((element) => element.id == products.id);
    if (cart.contains(product)) {
      cart.add(product);
    } else {
      cart.remove(product);
    }
    notifyListeners();
  }
}
