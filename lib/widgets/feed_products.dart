import 'package:flutter/material.dart';

class FeedsProducts extends StatefulWidget {
  @override
  _FeedsProductsState createState() => _FeedsProductsState();
}

class _FeedsProductsState extends State<FeedsProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 300.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.grey.shade200),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints(
                  minHeight: 100,
                  maxHeight: MediaQuery.of(context).size.height * 0.3,
              ),
              child: Image.network(
                'https://images.unsplash.com/photo-1615485290382-441e4d049cb5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1700&q=80',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('\$15.0',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity: 2',
                        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey.shade400),
                      ),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(10.0),
                        child: Icon(Icons.more_horiz, color: Colors.grey.shade400,),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
