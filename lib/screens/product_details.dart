import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/provider/cart_provider.dart';
import 'package:grocery_app/provider/fav_provider.dart';
import 'package:grocery_app/widgets/feed_products.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/provider/products.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/ProductDetails';
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context, listen: false);
    final productList = productProvider.products;
    final productId = ModalRoute.of(context).settings.arguments as String;
    final cartProvider = Provider.of<CartProvider>(context);
    final prodAttr = productProvider.byId(productId);
    final favProvider = Provider.of<FavProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.network(
              prodAttr.imgUrl,
            ),
          ),
          SingleChildScrollView(
            child: ProductBody(prodAttr: prodAttr, productList: productList),
          ),
          CartBottomBar(
            cartProvider: cartProvider,
            productId: productId,
            prodAttr: prodAttr,
            favProvider: favProvider,
          ),
        ],
      ),
    );
  }
}

class ProductBody extends StatelessWidget {
  final Product prodAttr;
  final List<Product> productList;

  ProductBody({
    @required this.prodAttr,
    @required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      '\$ ${prodAttr.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      category: 'Title: ',
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
                  ],
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
    );
  }
}

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({
    Key key,
    @required this.cartProvider,
    @required this.productId,
    @required this.prodAttr,
    @required this.favProvider,
  }) : super(key: key);

  final CartProvider cartProvider;
  final String productId;
  final Product prodAttr;
  final FavProvider favProvider;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(side: BorderSide.none),
                ),
                child: Text(
                  cartProvider.getCartItems.containsKey(productId)
                      ? 'In Cart'
                      : 'Add to Cart',
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  //ATH..Make this button disabled when clicked
                  cartProvider.addItemsToCart(productId, prodAttr.price,
                      prodAttr.name, prodAttr.imgUrl);
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              height: 50.0,
              child: IconButton(
                icon: Badge(
                  badgeColor: Colors.indigo,
                  animationType: BadgeAnimationType.slide,
                  toAnimate: true,
                  position: BadgePosition.topEnd(top: 5),
                  badgeContent: Text(
                    cartProvider.getCartItems.length.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.indigo,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/CartScreen');
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey,
              height: 50.0,
              child: IconButton(
                icon: Icon(
                  favProvider.getFavItems.containsKey(productId)
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: favProvider.getFavItems.containsKey(productId)
                      ? Colors.red
                      : Colors.white,
                ),
                onPressed: () {
                  favProvider.addAndRemoveFromFav(productId, prodAttr.price,
                      prodAttr.name, prodAttr.imgUrl);
                },
              ),
            ),
          ),
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
