import 'package:flutter/material.dart';
import 'package:grocery_app/provider/cart_provider.dart';
import 'package:grocery_app/provider/products.dart';
import 'package:grocery_app/screens/cart.dart';
import 'package:grocery_app/screens/feeds.dart';
import 'package:grocery_app/screens/wishlist.dart';
import 'package:grocery_app/widgets/categories_feeds.dart';
import 'package:grocery_app/widgets/product_details.dart';
import 'package:provider/provider.dart';
import 'screens/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        initialRoute: '/BottomBarScreen',
        routes: {
          '/BottomBarScreen': (context) => BottomBarScreen(),
          '/CartScreen': (context) => CartScreen(),
          '/WishListScreen': (context) => WishListScreen(),
          '/ProductDetails': (context) => ProductDetails(),
          '/FeedsScreen': (context) => FeedsScreen(),
          '/CategoriesFeedsScreen': (context) => CategoriesFeedsScreen(),
        },
      ),
    );
  }
}