import 'package:flutter/material.dart';

class FavAttr with ChangeNotifier {
  final String id;
  final String name;
  final String imgUrl;
  final double price;

  FavAttr({this.id, this.name, this.imgUrl, this.price});
}