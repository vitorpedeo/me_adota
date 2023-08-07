class Keys {
  static const isFirstTime = '@me_adota:is_first_time';
  static const selectedState = '@me_adota:selected_state';
}

abstract class LocalDataSource {
  Future<void> init();

  T? getValue<T>(String key);

  Future<void> setValue<T>(String key, T value);
}
