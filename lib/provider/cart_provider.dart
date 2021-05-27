import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_attr.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};

  Map<String, CartAttr> get getCartItems {
    return _cartItems;
  }

  //Get total
  double get totalPrice {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.qty;
    });
    return total;
  }

  //Add products to cart
  void addItemsToCart(String productId, double price, String name, String imgUrl) {
  //if the item already exist in the cart, then update the qty else add it to the cart
    if(_cartItems.containsKey(productId)) {
      _cartItems.update(productId, (existingCartItem) => CartAttr(
        id: existingCartItem.id,
        name: existingCartItem.name,
        price: existingCartItem.price,
        qty: existingCartItem.qty + 1,
        imgUrl: existingCartItem.imgUrl
      ));
    } else {
        _cartItems.putIfAbsent(
            productId, () => CartAttr(
            id: DateTime.now().toString(),
            name: name,
            price: price,
            qty: 1,
            imgUrl: imgUrl
        ));
    }
    notifyListeners();
  }
}
