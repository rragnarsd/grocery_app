import 'package:flutter/material.dart';

class CartFull extends StatefulWidget {
  //dependency injection - pass data through constructor
  final String id;
  final String productId;
  final String name;
  final String imgUrl;
  final double price;
  final int qty;

  CartFull(
      {@required this.id,
      @required this.productId,
      @required this.name,
      @required this.imgUrl,
      @required this.price,
      @required this.qty});

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    double total = widget.price * widget.qty;
    return SafeArea(
      child: Container(
        height: 140.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Container(
              width: 130.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imgUrl),
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
                            widget.name,
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
                          onTap: () {},
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
                          '\$${widget.price}',
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
                              fontSize: 16.0, fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          child: Container(
                            child: Icon(Icons.remove),
                          ),
                          onTap: () {},
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
                              widget.qty.toString(),
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
                          onTap: () {},
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
    );
  }
}
