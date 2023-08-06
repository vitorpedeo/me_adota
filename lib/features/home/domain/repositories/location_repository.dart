import 'package:me_adota/features/home/domain/entities/city.dart';
import 'package:me_adota/features/home/domain/entities/state.dart';

abstract class LocationRepository {
  Future<List<StateEntity>> getStates();

  Future<List<CityEntity>> getCitiesByState(StateEntity state);
}
