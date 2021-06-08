import 'package:flutter/material.dart';
import 'package:grocery_app/models/fav_model.dart';
import 'package:grocery_app/provider/fav_provider.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'alert_dialogs.dart';

class WishListFull extends StatefulWidget {
  final String productId;

  WishListFull({this.productId});
  @override
  _WishListFullState createState() => _WishListFullState();
}

class _WishListFullState extends State<WishListFull> {
  @override
  Widget build(BuildContext context) {
    final favAttr = Provider.of<FavModel>(context);
    final favProvider = Provider.of<FavProvider>(context);
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
                            Text(
                              favAttr.name,
                              style: kTextStyleSmall.copyWith(
                                  fontSize: 18.0, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '\$${favAttr.price.toStringAsFixed(2)}',
                              style: kTextStyleXSmall,
                            )
                          ],
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
                              cancelActionText: 'Cancel',
                              defaultActionText: 'Continue',
                                function: () => Navigator.of(context).pop(true)
                            );
                            if (continueRequest == true) {
                              favProvider.removeItemFromFav(widget.productId);
                            }
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
