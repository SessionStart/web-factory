import 'package:flutter/material.dart';

import 'mutual_theme.dart';

final lightTheme = ThemeData(
  primarySwatch: Colors.indigo,
  primaryColor: primaryColor,
  backgroundColor: Color(0xFFFFFFFF),
  scaffoldBackgroundColor: Color(0xFFF6F8FF),
  canvasColor: canvasColor,
  accentColor: accentColor,
  buttonColor: buttonColor,
  brightness: Brightness.light,
  cardColor: Color(0xFFFFFFFF),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 92,
      color: Colors.black,
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
    headline5: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    button: TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  ),
);
