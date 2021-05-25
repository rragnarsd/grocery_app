import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/cart_empty.dart';
import 'package:grocery_app/widgets/cart_full.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    List products = [];
    return !products.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Cart Items'),
              actions: [IconButton(icon: Icon(Icons.delete), onPressed: () {})],
            ),
            body: Column(
                /*mainAxisAlignment: MainAxisAlignment.spaceBetween,*/
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return CartFull();
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
                    ))),
          ],
        ),
      ),
    );
  }
}
