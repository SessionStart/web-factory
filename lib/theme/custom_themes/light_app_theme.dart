import 'package:flutter/material.dart';
import 'package:web_factory/theme/themes/dark_theme.dart';

import 'abstract_custom_theme.dart';

class LightAppTheme implements AbstractCustomTheme {
  @override
  List<BoxShadow> get boxShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 20.0,
          spreadRadius: 2.0,
          offset: Offset(
            0.0,
            3.0,
          ),
        ),
      ];

  @override
  LinearGradient get mainGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          darkTheme.buttonColor,
          darkTheme.accentColor,
        ],
      );

  @override
  List<BoxShadow> get listViewBoxShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 5.0,
      spreadRadius: 2.0,
      offset: Offset(
        0.0,
        2.0,
      ),
    ),
  ];
}
