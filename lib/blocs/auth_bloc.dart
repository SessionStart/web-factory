import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:web_factory/data/repositories/user_repository/hive_user_repository/hive_user_repository.dart';
import 'package:web_factory/models/user.dart';

class AuthBloc extends ChangeNotifier {
  AuthBloc({@required this.userRepository});

  final HiveUserRepository userRepository;

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> auth() async {
    await userRepository.create(
      User(
        userLogin: loginController.text,
        userPassword: passwordController.text,
      ),
    );
  }
}
