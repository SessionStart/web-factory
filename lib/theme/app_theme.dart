import 'package:flutter/material.dart';

abstract class AppTheme {
  static final boxShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.03),
      blurRadius: 20.0, // soften the shadow
      spreadRadius: 2.0, //extend the shadow
      offset: Offset(
        0.0, // Move to right 10  horizontally
        3.0, // Move to bottom 10 Vertically
      ),
    ),
  ];
}