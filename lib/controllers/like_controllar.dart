import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modal/api_modal.dart';

class LikeControllar with ChangeNotifier {
  // List<String> get likedItems => _likedItems;

  Map<int, bool> _likedItems = {};

  bool isLiked(Products product) {
    return _likedItems[product.id.toString()] ?? false;
  }

  void toggleLike(Products products) {
    _likedItems[products.id] = (_likedItems[products.id.toString()] ?? false);
    notifyListeners();
  }
}
