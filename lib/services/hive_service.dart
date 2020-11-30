import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  /// Конфигурация без запуска
  Future<void> configure() async {
    await Hive.initFlutter();
    _registerAdapters();
  }

  /// Ргистрация адапетров для сохранения
  void _registerAdapters() {}
}
