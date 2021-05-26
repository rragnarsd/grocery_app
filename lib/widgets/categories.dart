import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final int index;

  Categories({this.index});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Map<String, Object>> categories = [
    {
      'categoryName': 'Vegetables',
      'categoryPath': 'assets/images/randy-fath.jpg'
    },
    {
      'categoryName': 'Fruits',
      'categoryPath': 'assets/images/julia-zolotova-M.jpg'
    },
    {'categoryName': 'Drinks', 'categoryPath': 'assets/images/mahbod-akhzam.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/FeedsScreen');
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(categories[widget.index]['categoryPath']),
                fit: BoxFit.cover,
              )),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          width: 150.0,
          height: 150.0,
        ),
      ),
      Positioned(
        bottom: 0,
        left: 10,
        right: 10,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 7),
          color: Colors.grey.shade200,
          child: Text(
            categories[widget.index]['categoryName'],
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
        ),
      )
    ]);
  }
}
