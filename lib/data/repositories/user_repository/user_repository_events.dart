import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_site/models/user.dart';

enum UserRepositoryEventType { Crated, Deleted, Updated }

class UserRepositoryEvent {
  final User user;
  final UserRepositoryEventType type;

  UserRepositoryEvent({
    @required this.user,
    @required this.type,
  });
}
