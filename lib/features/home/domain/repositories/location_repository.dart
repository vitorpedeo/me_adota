import 'package:dartz/dartz.dart';
import 'package:me_adota/features/global/infra/rest_client/rest_client_error.dart';
import 'package:me_adota/features/home/domain/entities/city.dart';
import 'package:me_adota/features/home/domain/entities/state.dart';

abstract class LocationRepository {
  Future<Either<RestClientError, List<StateEntity>>> getStates();

  Future<void> setSelectedState(StateEntity state);

  String? getSelectedState();

  Future<Either<RestClientError, List<CityEntity>>> getCitiesByState(
      StateEntity state);

  Future<void> setSelectedCity(CityEntity city);

  String? getSelectedCity();
}
