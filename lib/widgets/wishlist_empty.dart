import 'package:flutter/material.dart';

class WishListEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 80),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/carts.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          'You don\'t have any wishlisted items',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Would you like to add something?',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/FeedsScreen');
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Shop Now',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
