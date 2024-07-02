import 'package:flutter/material.dart';

import '../modal/api_modal.dart';

class CartController extends ChangeNotifier {
  Map<int, bool> cartid = {};

  bool cartpro(Products products) {
    return cartid[products.id.toString()] ?? false;
  }

  void cartadd(Products products) {
    cartid[products.id] = (cartid[products.id.toString()] ?? false);
    notifyListeners();
  }
}
