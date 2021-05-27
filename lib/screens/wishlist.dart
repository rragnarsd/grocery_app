import 'package:flutter/material.dart';
import 'package:grocery_app/provider/fav_provider.dart';
import 'package:grocery_app/widgets/wishlist_empty.dart';
import 'package:grocery_app/widgets/wishlist_full.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/WishListScreen';
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavProvider>(context);
    return favProvider.getFavItems.isEmpty
        ? Scaffold(body: WishListEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Wishlist'),
            ),
            body: ListView.builder(
              itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
              return WishListFull();
            }),
          );
  }
}
