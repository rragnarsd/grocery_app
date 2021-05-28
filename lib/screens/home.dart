import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/feeds.dart';
import 'package:grocery_app/widgets/categories.dart';
import 'package:grocery_app/widgets/popular_products.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/provider/products.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final popularItems = productsData.popularProducts;
    print('popularItems length ${popularItems.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Farmers Market'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
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
                  ExactAssetImage('assets/images/chantal.jpg'),
                  ExactAssetImage('assets/images/heder.jpg'),
                  ExactAssetImage('assets/images/gemma.jpg'),
                ],
              ),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0,),
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
                    onPressed: () {
                      Navigator.of(context).pushNamed(FeedsScreen.routeName, arguments: 'popular');
                    },
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
                  itemCount: popularItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChangeNotifierProvider.value(
                      value: popularItems[index],
                      child: PopularProducts(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
