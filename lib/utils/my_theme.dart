import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static const double MAX_MARGIN = 20.0;
  static const double MIN_MARGIN = -42.0;

  static const priceTextStyle = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 20,
    fontFamily: "Avenir",
    fontWeight: FontWeight.w800,
  );
  static const descriptionTextStyle = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 16,
    fontFamily: "Avenir",
    fontWeight: FontWeight.w500,
  );
  static const titleTextStyle = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 30,
    fontFamily: "",
  );
  static const titleAppBarTextStyle = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 20,
    fontFamily: "",
  );
  static const counterTextStyle = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 14,
    fontFamily: "Avenir",
    fontWeight: FontWeight.w800,
  );

  static const menuTextStyle = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 14,
    letterSpacing: 1,
    fontFamily: "Avenir",
    fontWeight: FontWeight.w800,
  );
}
