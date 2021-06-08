import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/product_btn.dart';

import '../constants.dart';

class CartWishEmpty extends StatelessWidget {
  final String title;
  final String subTitle;
  final String screen;
  final String btnText;

  CartWishEmpty({this.title, this.subTitle, this.screen, this.btnText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
        ),
        SizedBox(
          height: 20,
        ),
        Text(title, style: kTextStyleLarge.copyWith(fontWeight: FontWeight.w700)),
        SizedBox(
          height: 10,
        ),
        Text(
          subTitle,
          style: kTextStyleMedium.copyWith(fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ProductBtn(btnText: btnText, screen: screen,),
        )
      ],
    );
  }
}
