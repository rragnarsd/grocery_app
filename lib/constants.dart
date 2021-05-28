import 'package:flutter/material.dart';

const kTextStyleSmall = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);

const kTextStyleMedium = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
);

const kBoxDecorationAll = BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    color: Colors.grey,
);

const kBoxDecorationOnly = BoxDecoration(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(10.0),
      topLeft: Radius.circular(10.0),
    ),
    color: Colors.grey,
    image: null
);
