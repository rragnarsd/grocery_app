import 'package:flutter/material.dart';

class SocialBtn extends StatelessWidget {
  final String btnText;
  final int color;
  final Function function;

  SocialBtn({this.btnText, this.function, this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        child: Text(btnText),
        onPressed: function,
        style: ElevatedButton.styleFrom(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            primary: Color(color)),
      ),
    );
  }
}
