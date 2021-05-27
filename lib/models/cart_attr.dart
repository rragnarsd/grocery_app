import 'package:flutter/material.dart';

class CartAttr with ChangeNotifier {
  final String id;
  final String name;
  final int qty;
  final String imgUrl;
  final double price;

  CartAttr({this.id, this.name, this.qty, this.imgUrl, this.price});
}