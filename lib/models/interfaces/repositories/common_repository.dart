abstract class CommonRepository {
  /// В этом методе мы начинаме работу с репозиторием
  Future<void> init();

  /// Заканчиваем работу с репозиторием и закрываем связь (в случае локального)
  Future<void> close();
}
