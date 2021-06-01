import 'package:flutter/material.dart';
import 'package:grocery_app/models/fav_attr.dart';
import 'package:grocery_app/provider/fav_provider.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/services/global_methods.dart';

import '../constants.dart';

class WishListFull extends StatefulWidget {
  final String productId;

  WishListFull({this.productId});
  @override
  _WishListFullState createState() => _WishListFullState();
}

class _WishListFullState extends State<WishListFull> {
  @override
  Widget build(BuildContext context) {
    final favAttr = Provider.of<FavAttr>(context);
    final favProvider = Provider.of<FavProvider>(context);
    GlobalMethods globalMethods = GlobalMethods();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        height: 100.0,
        margin: EdgeInsets.all(10.0),
        decoration: kBoxDecorationAll.copyWith(color: Colors.grey.shade200),
        child: Row(
          children: [
            Container(
                width: 130.0,
                decoration: kBoxDecorationOnly.copyWith(
                  image: DecorationImage(
                    image: NetworkImage(
                      favAttr.imgUrl,
                    ),
                    fit: BoxFit.fill,
                  ),
                )),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(favAttr.name,
                                style: kTextStyleSmall.copyWith(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text('\$${favAttr.price.toStringAsFixed(2)}',
                                style: kTextStyleXSmall,
                            )
                          ],
                        ),
                        InkWell(
                          child: Container(
                            child: Icon(Icons.delete),
                          ),
                          onTap: () => {
                            globalMethods.onWarningAlert(
                                context, 'This item will be removed from your wishlist',
                                () => favProvider
                                    .removeItemFromFav(widget.productId))
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
