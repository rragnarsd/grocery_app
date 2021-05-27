import 'package:flutter/material.dart';
import 'package:grocery_app/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [
    Product(
        'onionId',
        'Onions',
        'About the product',
        'Vegetables',
        'https://images.unsplash.com/photo-1604880273230-122708d0ba2c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1700&q=80',
        4.99,
        203,
        false,
        true),
    Product(
        'paprikaId',
        'Paprika',
        'About the product',
        'Vegetables',
        'https://images.unsplash.com/photo-1614260025937-b4ecb6eb9165?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1953&q=80',
        1.99,
        100,
        false,
        false),
    Product(
        'AvocadoId',
        'Avocado',
        'About the product',
        'Fruits',
        'https://images.unsplash.com/photo-1597658939722-145d6439f1c5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1867&q=80',
        7.99,
        240,
        false,
        false),
    Product(
        'StrawberryId',
        'Strawberries',
        'About the product',
        'Fruits',
        'https://images.unsplash.com/photo-1488551511020-571c741f122a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80',
        5.99,
        530,
        false,
        true),
    Product(
        'AppleId',
        'Apples',
        'About the product',
        'Fruits',
        'https://images.unsplash.com/photo-1601601852592-a7da178848a4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1300&q=80',
        4.20,
        300,
        false,
        false),
    Product(
        'TomatoId',
        'Tomatoes',
        'About the product',
        'Vegetables',
        'https://images.unsplash.com/photo-1467020323552-36f7bf0e30e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80',
        0.99,
        500,
        false,
    false),
    Product(
        'KaleId',
        'Kale',
        'About the product',
        'Vegetables',
        'https://images.unsplash.com/photo-1472141341085-dab5ea0df9a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1952&q=80',
        1.30,
        40,
        false,
    true),
    Product(
        'PepperId',
        'Peppers',
        'About the product',
        'Vegetables',
        'https://images.unsplash.com/photo-1606170034765-13ccb20615b5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fHZlZ2V0YWJsZXMlMjBncm9jZXJ5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        0.94,
        600,
        false,
    false),
    Product(
        'OrangeId',
        'Oranges',
        'About the product',
        'Fruits',
        'https://images.unsplash.com/photo-1610368238081-28e4e3f6d490?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1300&q=80',
        1.30,
        150,
        false,
    true),
    Product(
        'LimeId',
        'Lime',
        'About the product',
        'Fruits',
        'https://images.unsplash.com/photo-1511640234009-a472b03307a9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
        0.50,
        600,
        false,
    false),
    Product(
        'DragonFruitId',
        'Dragonfruit',
        'About the product',
        'Fruits',
        'https://images.unsplash.com/photo-1552267349-77e8b9af61c2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
        4.99,
        60,
        false,
    false),
    Product(
        'PapayaId',
        'Papaya',
        'About the product',
        'Fruits',
        'https://images.unsplash.com/photo-1517383733478-12faa4d8222f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cGFwYXlhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        3.20,
        300,
        false,
    true),
    Product(
        'BananaId',
        'Bananas',
        'About the product',
        'Fruits',
        'https://images.unsplash.com/photo-1606050627722-3646950540ca?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGJhbmFuYXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        2.59,
        560,
        false,
    true),
    Product(
        'CucumberId',
        'Cucumber',
        'About the product',
        'Vegetables',
        'https://images.unsplash.com/photo-1449300079323-02e209d9d3a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y3VjdW1iZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
        0.39,
        200,
        false,
    false),
    Product(
        'CauliflowerId',
        'Cauliflower',
        'About the product',
        'Vegetables',
        'https://images.unsplash.com/photo-1604060340947-7639e2a10c98?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1275&q=80',
        0.59,
        300,
        false,
    false),
    Product(
        'CarrotId',
        'Carrots',
        'About the product',
        'Vegetables',
        'https://images.unsplash.com/photo-1601980605894-d2cd776749a5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
        1.20,
        400,
        false,
    true),
  ];

  List<Product> get products {
    return _products;
  }
  
  List<Product> get popularProducts {
    return _products.where((element) => element.isPopular).toList();
  }

  //Is this id equal to the productId
  Product byId(String productId) {
    return _products.firstWhere((element) => element.id == productId);
  }


  List<Product> byCategory(String categoryName) {
    List _categoryList = _products
        .where((element) =>
            element.category.toLowerCase().contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }


}
