import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_attr.dart';
import 'package:grocery_app/provider/cart_provider.dart';
import 'package:grocery_app/widgets/product_details.dart';
import 'package:provider/provider.dart';

class CartFull extends StatefulWidget {
  final String productId;

  CartFull({this.productId});

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  void _showDialog(String title, String subtitle, Function function) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                Icon(
                  Icons.warning,
                  size: 50.0,
                ),
                Text('Are you sure you want to clear the cart?'),
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
              TextButton(onPressed: function, child: Text('Okay')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final cartAttr = Provider.of<CartAttr>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    double total = cartAttr.price * cartAttr.qty;
    return SafeArea(
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
            arguments: widget.productId),
        child: Container(
          height: 140.0,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.grey.shade200,
          ),
          child: Row(
            children: [
              Container(
                width: 130.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
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
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                            child: Container(
                              child: Icon(Icons.delete),
                            ),
                            onTap: () {
                              _showDialog('title', 'subtitle', () => cartProvider.removeItemFromCart(widget.productId));
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
                            '\$${cartAttr.price}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
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
                            '\$${total}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Quantity:',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
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
                                        cartAttr.price,
                                        cartAttr.name,
                                        cartAttr.imgUrl);
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
                                  cartAttr.imgUrl);
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
