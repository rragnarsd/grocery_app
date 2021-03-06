import 'package:flutter/material.dart';
import 'package:grocery_app/models/fav_model.dart';

class FavProvider with ChangeNotifier {
  Map<String, FavModel> _favItems = {};

  Map<String, FavModel> get getFavItems {
    return _favItems;
  }

  //Add products to cart
  void addAndRemoveFromFav(
      String productId, double price, String name, String imgUrl) {
    //if the item already exist in the cart, then update the qty else add it to the cart
    if (_favItems.containsKey(productId)) {
     removeItemFromFav(productId);
    } else {
      _favItems.putIfAbsent(
        productId,
        () => FavModel(
            id: DateTime.now().toString(),
            name: name,
            price: price,
            imgUrl: imgUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeItemFromFav(String productId) {
    _favItems.remove(productId);
    notifyListeners();
  }

  void clearFav() {
    _favItems.clear();
    notifyListeners();
  }
}
