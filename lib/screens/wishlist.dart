import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/wishlist_empty.dart';
import 'package:grocery_app/widgets/wishlist_full.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/WishListScreen';
  @override
  Widget build(BuildContext context) {
    List wishList = [];
    return wishList.isNotEmpty
        ? Scaffold(body: WishListEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Wishlist'),
            ),
            body: ListView.builder(
              itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
              return WishListFull();
            }),
          );
  }
}
