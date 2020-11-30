import 'package:flutter/material.dart';
import 'package:flutter_firebase_site/data/repositories/user_repository/abstract_user_repository.dart';
import 'package:flutter_firebase_site/models/interfaces/initializeble_interface.dart';
import 'package:flutter_firebase_site/utils/enums.dart';

class LaunchBloc extends ChangeNotifier implements Initializeble {
  LaunchBloc({@required AbstractUserRepository userRepository})
      : _userRepository = userRepository;

  AbstractUserRepository _userRepository;
  AuthStatus get authStatus => _getAuthStatus();

  AuthStatus _getAuthStatus() {
    final user = _userRepository.user;
    if (user != null) {
      return AuthStatus.Authorized;
    } else {
      return AuthStatus.Unauthorized;
    }
  }

  LaunchPages get pagesTree => _getAuthStatus() == AuthStatus.Authorized
      ? LaunchPages.Home
      : LaunchPages.Auth;

  @override
  void init(BuildContext context) {
    _userRepository.eventStream.listen((event) {});
  }
}
