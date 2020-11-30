import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_site/data/repositories/user_repository/abstract_user_repository.dart';

class RepositoryBloc extends ChangeNotifier {
  final AbstractUserRepository userRepository;

  RepositoryBloc({
    @required this.userRepository,
  });
}
