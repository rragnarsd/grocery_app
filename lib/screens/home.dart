import 'package:backdrop/backdrop.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/backlayer.dart';
import 'package:grocery_app/widgets/categories.dart';
import 'package:grocery_app/widgets/popular_products.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackdropScaffold(
      /*frontLayerBackgroundColor: Colors.grey.shade200,*/
      /*headerHeight: MediaQuery.of(context).size.height * 0.25,*/
      appBar: BackdropAppBar(
        title: Text('Grocery'),
      ),
      backLayer: BackLayerMenu(),
      frontLayer: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 190.0,
            width: double.infinity,
            child: Carousel(
              boxFit: BoxFit.fill,
              autoplay: true,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1000),
              dotSize: 7.0,
              dotIncreasedColor: Colors.white,
              dotBgColor: Colors.black.withOpacity(0.2),
              dotPosition: DotPosition.bottomCenter,
              showIndicator: true,
              indicatorBgPadding: 7.0,
              images: [
                ExactAssetImage('assets/images/charles-gao.jpg'),
                ExactAssetImage('assets/images/gemma.jpg'),
                ExactAssetImage('assets/images/mehrad-vosoughi.jpg'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  child: Text('View More'),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 180.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Categories(index: index);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Products',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  child: Text('View More'),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 285.0,
            margin: EdgeInsets.symmetric(horizontal: 3),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return PopularProducts();
                }),
          )
        ]),
      ),
    ));
  }
}
