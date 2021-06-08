import 'package:flutter/material.dart';

class CartModel with ChangeNotifier {
  final String id;
  final String name;
  final int qty;
  final String imgUrl;
  final double price;

  CartModel({this.id, this.name, this.qty, this.imgUrl, this.price});
}