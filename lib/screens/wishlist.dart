import 'package:flutter/material.dart';
import 'package:grocery_app/provider/fav_provider.dart';
import 'package:grocery_app/widgets/cart_wishlist_empty.dart';
import 'package:grocery_app/widgets/wishlist_full.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/WishListScreen';
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavProvider>(context);
    return favProvider.getFavItems.isEmpty
        ? Scaffold(body: CartWishEmpty(title: 'Your wishlist is empty', subTitle: 'Would you like to add something?', screen: '/FeedsScreen', btnText: 'Shop Now',))
        /*? Scaffold(body: WishListEmpty())*/
        : Scaffold(
            appBar: AppBar(
              title: Text('Wishlist (${favProvider.getFavItems.length})'),
            ),
            body: ListView.builder(
              itemCount: favProvider.getFavItems.length,
                itemBuilder: (BuildContext context, int index) {
              return ChangeNotifierProvider.value(
                  value: favProvider.getFavItems.values.toList()[index],
                  child: WishListFull(
                    productId: favProvider.getFavItems.keys.toList()[index],
                  ),
              );
            }),
          );
  }
}
