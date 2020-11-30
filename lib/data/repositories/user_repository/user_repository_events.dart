import 'package:flutter/foundation.dart';
import 'package:web_factory/models/user.dart';

enum UserRepositoryEventType { Crated, Deleted, Updated }

class UserRepositoryEvent {
  final User user;
  final UserRepositoryEventType type;

  UserRepositoryEvent({
    @required this.user,
    @required this.type,
  });
}
