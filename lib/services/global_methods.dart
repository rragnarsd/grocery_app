import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

class GlobalMethods {
  void onAlertButtonsPressed(BuildContext context, Function function) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Are you sure you want to delete this item?",
      buttons: [
        DialogButton(
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.white,
            border: Border.all(color: Colors.indigo)
        ),
        DialogButton(
          child: Text(
            "Delete",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            function();
            Navigator.pop(context);
          },
          color: Colors.indigo,
        )
      ],
    ).show();
  }
}