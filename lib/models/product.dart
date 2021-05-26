import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  final String name;
  final String description;
  final String category;
  final String imgUrl;
  final double price;
  final int qty;
  final bool isFav;
  final bool isPopular;

  Product(this.id, this.name, this.description, this.category, this.imgUrl, this.price, this.qty, this.isFav, this.isPopular);
}