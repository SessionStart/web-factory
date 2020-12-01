import 'package:flutter/material.dart';

import 'mutual_theme.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  primaryColor: primaryColor,
  backgroundColor: Color(0xFF151515),
  scaffoldBackgroundColor: Color(0xFF151515),
  canvasColor: canvasColor,
  accentColor: accentColor,
  buttonColor: buttonColor,
  brightness: Brightness.dark,
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
