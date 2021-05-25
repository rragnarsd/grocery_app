import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/feed_products.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/FeedsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 200/300,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(
        30,
        (index) => FeedsProducts(),
      ),
    ),
    );
  }
}
