import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

class GlobalMethods {
  void onWarningAlert(BuildContext context, String desc, String btnTextOne, String btnTextTwo, Function function) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Are you sure?",
      desc: desc,
      buttons: [
        DialogButton(
            child: Text(
              btnTextOne,
              /*"Cancel",*/
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.white,
            border: Border.all(color: Colors.indigo)
        ),
        DialogButton(
          child: Text(
            btnTextTwo,
           /* "Delete",*/
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

  void onSuccessAlert(BuildContext context, String title, String desc) {
    Alert(
      context: context,
      type: AlertType.success,
      title: title,
      desc: desc,
    /*  buttons: [
        DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
        ),
      ],*/
    ).show();
  }


  void onAuthAlert(BuildContext context, String desc) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Error Occurred!",
      desc: desc,
    ).show();
  }
}