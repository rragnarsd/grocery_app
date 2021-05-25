import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/widgets/feed_products.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/FeedsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 6,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => FeedsProducts(),
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(3, index.isEven ? 4 : 5),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
      )
    );
  }
}
