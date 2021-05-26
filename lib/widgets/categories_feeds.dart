import 'package:flutter/material.dart';
import 'package:grocery_app/provider/products.dart';
import 'package:grocery_app/widgets/feed_products.dart';
import 'package:provider/provider.dart';

class CategoriesFeedsScreen extends StatelessWidget {
  static const routeName = '/CategoriesFeedsScreen';

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context, listen: false);
    final categoryName = ModalRoute.of(context).settings.arguments as String;
    final productList = productProvider.byCategory(categoryName);
    return Scaffold(
        body: GridView.count(
            childAspectRatio: 260/300,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 2,
            children:
            List.generate(productList.length, (index) {
              //ChangeNotiferProvider.value listens to the changes in the product model class
              //and passes it to the FeedProducts widget
              return ChangeNotifierProvider.value(
                value: productList[index],
                child: FeedsProducts(),
              );
            })
        )
    );
  }
}
