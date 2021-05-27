import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/cart_empty.dart';
import 'package:grocery_app/widgets/cart_full.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    /*List products = [];*/
    return cartProvider.getCartItems.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Cart Items'),
              actions: [IconButton(icon: Icon(Icons.delete), onPressed: () {})],
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: cartProvider.getCartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CartFull(
                          //convert the map object to a list
                          id: cartProvider.getCartItems.values.toList()[index].id,
                          productId: cartProvider.getCartItems.keys.toList()[index],
                          name: cartProvider.getCartItems.values.toList()[index].name,
                          imgUrl: cartProvider.getCartItems.values.toList()[index].imgUrl,
                          price: cartProvider.getCartItems.values.toList()[index].price,
                          qty: cartProvider.getCartItems.values.toList()[index].qty,
                        );
                      },
                    ),
                  ),
                ),
                Checkout()
              ],
            ),
          );
  }
}

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '\$3000',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
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
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
