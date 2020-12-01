import 'package:flutter/foundation.dart';
import 'package:web_factory/theme/custom_themes/abstract_custom_theme.dart';

class ThemeBloc extends ChangeNotifier {
  AbstractCustomTheme _customTheme;

  ThemeBloc({@required AbstractCustomTheme customTheme})
      : _customTheme = customTheme;

  AbstractCustomTheme get customTheme => _customTheme;
  set customTheme(AbstractCustomTheme val) {
    _customTheme = val;
    notifyListeners();
  }
}
