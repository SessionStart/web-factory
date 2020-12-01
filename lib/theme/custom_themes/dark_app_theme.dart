import 'package:flutter/material.dart';
import 'package:web_factory/theme/themes/dark_theme.dart';

import 'abstract_custom_theme.dart';

class DarkAppTheme implements AbstractCustomTheme {
  @override
  List<BoxShadow> get boxShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
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
}
