import 'package:flutter/material.dart';

Future<bool> showAlertDialog(
  BuildContext context, {
  @required String title,
  @required String content,
  String cancelActionText,
  String color,
  Function function,
  @required String defaultActionText,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        if (cancelActionText != null)
          OutlinedButton(
            child: Text(cancelActionText),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        OutlinedButton(
          onPressed: function,
          /*onPressed: () => Navigator.of(context).pop(true),*/
          child: Text(defaultActionText),
        )
      ],
    ),
  );
}
