import 'dart:async';

import 'package:flutter_firebase_site/data/repositories/user_repository/abstract_user_repository.dart';
import 'package:flutter_firebase_site/data/repositories/user_repository/user_repository_events.dart';
import 'package:flutter_firebase_site/models/user.dart';
import 'package:hive/hive.dart';

class HiveUserRepository extends AbstractUserRepository {
  final _repositoryKey = 'HiveUserStore';
  final _userKey = 'HiveUserStore_UserKey';
  Box<User> _userBox;
  final _eventsController = StreamController<UserRepositoryEvent>.broadcast();

  @override
  Future<void> init() async {
    _userBox = await Hive.openBox(_repositoryKey);
  }

  @override
  Future<void> update(User user) async {
    await _userBox.put(_userKey, user);
    _eventsController.add(
      UserRepositoryEvent(
        type: UserRepositoryEventType.Updated,
        user: user,
      ),
    );
  }

  @override
  User get user => _userBox.get(_userKey);

  @override
  Stream<UserRepositoryEvent> get eventStream => _eventsController.stream;

  @override
  Future<void> clear() async {
    await _userBox.clear();
    _eventsController.add(
      UserRepositoryEvent(
        type: UserRepositoryEventType.Deleted,
        user: null,
      ),
    );
  }

  @override
  Future<void> create(User user) async {
    await _userBox.put(_userKey, user);
    _eventsController.add(
      UserRepositoryEvent(
        type: UserRepositoryEventType.Crated,
        user: user,
      ),
    );
  }

  @override
  Future<void> close() => _userBox.close();
}
