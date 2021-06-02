import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/alert_dialogs.dart';
import 'package:grocery_app/widgets/cart_full.dart';
import 'package:grocery_app/widgets/cart_wishlist_empty.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/provider/cart_provider.dart';

import '../constants.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty
        ? Scaffold(body: CartWishEmpty(title: 'Your Cart is Empty', subTitle: 'Would you like to buy something?', screen: '/FeedsScreen', btnText: 'Shop Now',))
        : Scaffold(
            appBar: AppBar(
              title: Text('Cart (${cartProvider.getCartItems.length})'),
              actions: [
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      final continueRequest = await showAlertDialog(
                        context,
                        title: 'Are you sure?',
                        content: 'These items will be removed!',
                        defaultActionText: 'Continue',
                        cancelActionText: 'Cancel',
                      );
                      if (continueRequest == true) {
                        cartProvider.clearCart();
                      }
                    })
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: cartProvider.getCartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChangeNotifierProvider.value(
                          value:
                              cartProvider.getCartItems.values.toList()[index],
                          child: CartFull(
                            //convert the map object to a list
                            productId:
                                cartProvider.getCartItems.keys.toList()[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Total:',
                                style: kTextStyleSmall.copyWith(color: Colors.indigo)
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '\$${cartProvider.totalPrice.toStringAsFixed(2)}',
                                style: kTextStyleSmall
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.37,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Check Out',
                                style: kTextStyleXSmall
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
