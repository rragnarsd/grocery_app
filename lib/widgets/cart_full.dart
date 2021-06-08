import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/provider/cart_provider.dart';
import 'package:grocery_app/screens/product_details.dart';
import 'package:grocery_app/widgets/alert_dialogs.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class CartFull extends StatefulWidget {
  final String productId;

  CartFull({this.productId});

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    final cartAttr = Provider.of<CartModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    double total = cartAttr.price * cartAttr.qty;
    return SafeArea(
      child: InkWell(
        onTap: () => Navigator.pushNamed(
            context, ProductDetailsScreen.routeName,
            arguments: widget.productId),
        child: Container(
          height: 140.0,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0),
            ),
            color: Colors.grey.shade200,
          ),
          child: Row(
            children: [
              Container(
                width: 130.0,
                decoration: kBoxDecorationOnly.copyWith(
                  image: DecorationImage(
                    image: NetworkImage(cartAttr.imgUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              cartAttr.name,
                              style: kTextStyleXSmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                            child: Container(
                              child: Icon(Icons.delete),
                            ),
                            onTap: () async {
                              final continueRequest = await showAlertDialog(
                                context,
                                title: 'Are you sure?',
                                content: 'This item will be removed!',
                                defaultActionText: 'Continue',
                                cancelActionText: 'Cancel',
                                function: () => Navigator.of(context).pop(true)
                              );
                              if (continueRequest == true) {
                                cartProvider
                                    .removeItemFromCart(widget.productId);
                              }
                            },
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('Price:'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '\$${cartAttr.price.toStringAsFixed(2)}',
                            style: kTextStyleXSmall,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Total:'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '\$${total.toStringAsFixed(2)}',
                            style: kTextStyleXSmall.copyWith(
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Quantity:',
                            style: kTextStyleXSmall,
                          ),
                          Spacer(),
                          InkWell(
                            child: Container(
                              child: Icon(
                                Icons.remove,
                                color: cartAttr.qty < 2
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                            onTap: cartAttr.qty < 2
                                ? null
                                : () {
                                    cartProvider.reduceItemsInCart(
                                      widget.productId,
                                    );
                                  },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Card(
                            elevation: 10,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.10,
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                cartAttr.qty.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            child: Container(
                              child: Icon(Icons.add),
                            ),
                            onTap: () {
                              cartProvider.addItemsToCart(
                                widget.productId,
                                cartAttr.price,
                                cartAttr.name,
                                cartAttr.imgUrl,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
