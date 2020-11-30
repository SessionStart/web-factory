import 'package:flutter_firebase_site/models/user.dart';
import 'package:hive/hive.dart';

class UserAdapter extends TypeAdapter<User> {
  UserAdapter(this.typeId);

  @override
  final int typeId;

  @override
  User read(BinaryReader reader) {
    return User(
      userLogin: reader.readString(),
      userPassword: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer..writeString(obj.userLogin)..writeString(obj.userPassword);
  }
}
