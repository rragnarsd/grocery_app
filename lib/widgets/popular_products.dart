import 'package:flutter/material.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/provider/fav_provider.dart';
import 'package:grocery_app/screens/product_details.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/provider/cart_provider.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Product>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final favProvider = Provider.of<FavProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(Radius.circular(10.0)
            )),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                arguments: productProvider.id),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            productProvider.imgUrl,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 7,
                      right: 10,
                      child: Icon(
                          Icons.favorite,
                          color: favProvider.getFavItems.containsKey(productProvider.id) ? Colors.red : Colors.transparent
                      ),
                    ),
                    Positioned(
                      top: 7,
                      right: 10,
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.white
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.grey.shade200,
                        child: Text(
                          '\$ ${productProvider.price.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productProvider.name,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            productProvider.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: cartProvider.getCartItems
                                      .containsKey(productProvider.id)
                                  ? () {}
                                  : () {
                                      cartProvider.addItemsToCart(
                                          productProvider.id,
                                          productProvider.price,
                                          productProvider.name,
                                          productProvider.imgUrl);
                                    },
                              borderRadius: BorderRadius.circular(20.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  cartProvider.getCartItems
                                      .containsKey(productProvider.id) ? Icons.done_all :
                                  Icons.shopping_bag,
                                  size: 25.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
