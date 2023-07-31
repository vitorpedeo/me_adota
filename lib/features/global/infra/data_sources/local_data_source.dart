class Keys {
  static const isFirstTime = '@me_adota:is_first_time';
}

abstract class LocalDataSource {
  Future<void> init();

  T? getValue<T>(String key);

  Future<void> setValue<T>(String key, T value);
}
