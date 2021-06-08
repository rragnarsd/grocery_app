import 'package:flutter/material.dart';

class FavModel with ChangeNotifier {
  final String id;
  final String name;
  final String imgUrl;
  final double price;

  FavModel({this.id, this.name, this.imgUrl, this.price});
}