import 'package:flutter/material.dart';

import '../constants.dart';

class ProductBtn extends StatelessWidget {
  final String screen;
  final String btnText;

  ProductBtn({this.screen, this.btnText});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(screen);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(btnText, style: kTextStyleSmall),
      ),
    );
  }
}
