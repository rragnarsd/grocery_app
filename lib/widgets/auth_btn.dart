import 'package:flutter/material.dart';

import '../constants.dart';

class AuthBtn extends StatelessWidget {
  final String btnText;
  final Function function;

  AuthBtn({this.btnText, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.0,
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          btnText,
        style: kTextStyleSmall.copyWith(fontWeight: FontWeight.normal, letterSpacing: 1.2),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.all(10.0),
        ),
        onPressed: function,
      ),
    );
  }
}
