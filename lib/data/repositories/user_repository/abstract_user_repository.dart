import 'package:flutter_firebase_site/data/repositories/user_repository/user_repository_events.dart';
import 'package:flutter_firebase_site/models/interfaces/repositories/common_repository.dart';
import 'package:flutter_firebase_site/models/user.dart';

abstract class AbstractUserRepository implements CommonRepository {
  Future<void> create(User user);
  Future<void> update(User user);
  Future<void> clear();
  User get user;
  Stream<UserRepositoryEvent> get eventStream;
}
