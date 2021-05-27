import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/product.dart';
import 'file:///C:/Users/regin/AndroidStudioProjects/grocery_app/lib/screens/product_details.dart';
import 'package:provider/provider.dart';

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
        /*onTap: () => Navigator.of(context).pushNamed('/ProductDetails'),*/
        child: Container(
          width: 250.0,
          height: 290.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Colors.grey.shade200,
          ),
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
                Badge(
                  toAnimate: true,
                  shape: BadgeShape.square,
                  badgeColor: Colors.indigo,
                  borderRadius: BorderRadius.circular(5.0),
                  badgeContent: Text(
                    'New',
                    style: TextStyle(color: Colors.white),
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
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '\$ ${productProvider.price.toString()}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quantity: ${productProvider.qty}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade400),
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
