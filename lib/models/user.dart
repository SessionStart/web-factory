import 'dart:convert';

class User {
  final String userLogin;
  final String userPassword;
  User({
    this.userLogin,
    this.userPassword,
  });

  User copyWith({
    String userLogin,
    String userPassword,
  }) {
    return User(
      userLogin: userLogin ?? this.userLogin,
      userPassword: userPassword ?? this.userPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userLogin': userLogin,
      'userPassword': userPassword,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      userLogin: map['userLogin'],
      userPassword: map['userPassword'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() =>
      'User(userLogin: $userLogin, userPassword: $userPassword)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.userLogin == userLogin &&
        o.userPassword == userPassword;
  }

  @override
  int get hashCode => userLogin.hashCode ^ userPassword.hashCode;
}
