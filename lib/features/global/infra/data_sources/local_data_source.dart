class Keys {
  static const isFirstTime = '@me_adota:is_first_time';
  static const selectedState = '@me_adota:selected_state';
  static const selectedCity = '@me_adota:selected_city';
  static const isLogged = '@me_adota:is_logged';
}

abstract class LocalDataSource {
  Future<void> init();

  T? getValue<T>(String key);

  Future<void> setValue<T>(String key, T value);
}
