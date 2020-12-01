import 'package:flutter/material.dart';
import 'package:web_factory/theme/custom_themes/abstract_custom_theme.dart';

class ThemeBloc extends ChangeNotifier {
  AbstractCustomTheme _customTheme;
  ThemeData _themeData;

  ThemeBloc(
      {@required AbstractCustomTheme customTheme,
      @required ThemeData themeData})
      : _customTheme = customTheme,
        _themeData = themeData;

  AbstractCustomTheme get customTheme => _customTheme;
  set customTheme(AbstractCustomTheme val) {
    _customTheme = val;
    notifyListeners();
  }

  ThemeData get themeData => _themeData;
  set themeData(ThemeData val) {
    _themeData = val;
    notifyListeners();
  }
}
