import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/feed_products.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/provider/products.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/ProductDetails';
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context);
    final productList = productProvider.products;
    final productId = ModalRoute.of(context).settings.arguments as String;
    print('id ${productId}');
    final prodAttr = productProvider.byId(productId);
    return Scaffold(
      /*backgroundColor: Colors.grey.shade200,*/
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.network(
              prodAttr.imgUrl),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 220,
                ),
                Container(
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                prodAttr.name,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '\$ ${prodAttr.price}',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Details(
                          category: 'Category: ',
                          title: prodAttr.category,
                        ),
                        Details(
                          category: 'Name: ',
                          title: prodAttr.name,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: Text(
                            'Suggested Products',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          color: Colors.grey.shade300,
                          width: double.infinity,
                          height: 230,
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return ChangeNotifierProvider.value(
                                  value: productList[index],
                                  child: FeedsProducts(),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.black.withOpacity(0.4),
              /*  elevation: 0,*/
              actions: [
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/WishListScreen'),
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/CartScreen'),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(side: BorderSide.none),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Details extends StatelessWidget {
  final String title;
  final String category;

  Details({this.title, this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          Text(
            category,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
