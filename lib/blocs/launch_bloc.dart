import 'package:flutter/material.dart';
import 'package:flutter_firebase_site/utils/enums.dart';

class LaunchBloc extends ChangeNotifier {
  AuthStatus get authStatus => _getAuthStatus();

  AuthStatus _getAuthStatus() {
    return AuthStatus.Authorized;
  }

  LaunchPages get pagesTree => _getAuthStatus() == AuthStatus.Authorized
      ? LaunchPages.Home
      : LaunchPages.Auth;
}
