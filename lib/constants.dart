import 'package:flutter/material.dart';

const kTextStyleXSmall = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w700,
);

const kTextStyleSmall = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w700,
);

const kTextStyleMedium = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w700,
);

const kTextStyleLarge = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.w700,
);

const kBoxDecorationAll = BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    color: Colors.grey,
    image: null,
    boxShadow: null,
);

const kBoxDecorationOnly = BoxDecoration(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(10.0),
      topLeft: Radius.circular(10.0),
    ),
    color: Colors.grey,
    image: null
);

const kInputDecoration = InputDecoration(
  prefixIcon: null,
  suffixIcon: null,
  hintText: null,
  labelText: '',
  labelStyle: TextStyle(color: Colors.black54),
  border: OutlineInputBorder(),
);