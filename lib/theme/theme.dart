import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primarySwatch: Colors.indigo,
  primaryColor: Color(0xFF3922CB),
  backgroundColor: Color(0xFF151515),
  scaffoldBackgroundColor: Color(0xFF151515),
  canvasColor: Color(0xFF3922CB),
  accentColor: Color(0xFF3922CB),
  cardColor: Color(0xFF262626),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 92,
      color: Colors.white,
      fontWeight: FontWeight.w900,
    ),
    headline3: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
    headline4: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    button: TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  ),
);
