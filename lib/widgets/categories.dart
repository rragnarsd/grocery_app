import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final int index;

  Categories({this.index});

  List<Map<String, Object>> categories = [
    {
      'categoryName': 'Vegetables',
      'categoryPath': 'assets/images/randy-fath.jpg'
    },
    {
      'categoryName': 'Fruits',
      'categoryPath': 'assets/images/julia-zolotova-M.jpg'
    },
    {'categoryName': 'Coffee', 'categoryPath': 'assets/images/sangga-rima.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(categories[index]['categoryPath']),
              fit: BoxFit.cover,
            )),
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        width: 150.0,
        height: 150.0,
      ),
      Positioned(
        bottom: 0,
        left: 10,
        right: 10,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 7),
          color: Colors.grey.shade200,
          child: Text(
            categories[index]['categoryName'],
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
        ),
      )
    ]);
  }
}
