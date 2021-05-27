import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/cart_empty.dart';
import 'package:grocery_app/widgets/cart_full.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/provider/cart_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    void _onAlertButtonsPressed(Function function) {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Are you sure you want to clear the cart?",
        buttons: [
          DialogButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Colors.white,
              border: Border.all(color: Colors.indigo)),
          DialogButton(
            child: Text(
              "Delete",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              function();
              Navigator.pop(context);
            },
            color: Colors.indigo,
          )
        ],
      ).show();
    }

    return cartProvider.getCartItems.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Cart (${cartProvider.getCartItems.length})'),
              actions: [
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _onAlertButtonsPressed(() => cartProvider.clearCart());
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
