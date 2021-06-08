import 'package:flutter/material.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/screens/product_details.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class FeedsProducts extends StatefulWidget {

  @override
  _FeedsProductsState createState() => _FeedsProductsState();
}

class _FeedsProductsState extends State<FeedsProducts> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: productProvider.id),
        child: Container(
          width: 250.0,
          height: 290.0,
        decoration: kBoxDecorationAll.copyWith(color: Colors.grey.shade200),
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(2.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: 100,
                      maxHeight: MediaQuery.of(context).size.height * 0.17,
                    ),
                    child: Image.network(
                      productProvider.imgUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ]),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productProvider.name,
                      overflow: TextOverflow.ellipsis,
                      style: kTextStyleSmall,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '\$ ${productProvider.price.toString()}',
                      overflow: TextOverflow.ellipsis,
                      style: kTextStyleXSmall,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quantity: ${productProvider.qty}',
                         style: kTextStyleXSmall.copyWith(fontSize: 14.0, color: Colors.grey.shade400),
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(10.0),
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
