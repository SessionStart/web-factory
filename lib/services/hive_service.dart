import 'package:flutter_firebase_site/data/repositories/adapers/user_adapter.dart';
import 'package:flutter_firebase_site/data/repositories/user_repository/abstract_user_repository.dart';
import 'package:flutter_firebase_site/data/repositories/user_repository/hive_user_repository/hive_user_repository.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  AbstractUserRepository userRepository;
  Future<void> init() async {
    await configure();
    await _initRepositories();
  }

  /// Конфигурация без запуска
  Future<void> configure() async {
    await Hive.initFlutter();
    _registerAdapters();
  }

  /// Ргистрация адапетров для сохранения
  void _registerAdapters() {
    Hive.registerAdapter(
      UserAdapter(0),
    );
  }

  Future<void> _initRepositories() async {
    userRepository = HiveUserRepository();
    await userRepository.init();
  }
}
