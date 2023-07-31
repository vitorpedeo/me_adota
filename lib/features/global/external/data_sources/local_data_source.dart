import 'package:me_adota/features/global/infra/data_sources/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceImpl implements LocalDataSource {
  late final SharedPreferences _instance;

  @override
  Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  @override
  T? getValue<T>(String key) {
    return _instance.get(key) as T?;
  }

  @override
  Future<void> setValue<T>(String key, T value) async {
    if (value is bool) {
      await _instance.setBool(key, value);
    } else if (value is int) {
      await _instance.setInt(key, value);
    } else if (value is double) {
      await _instance.setDouble(key, value);
    } else if (value is String) {
      await _instance.setString(key, value);
    } else if (value is List<String>) {
      await _instance.setStringList(key, value);
    }
  }
}
