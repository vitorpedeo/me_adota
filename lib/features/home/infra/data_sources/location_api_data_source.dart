import 'package:dartz/dartz.dart';
import 'package:me_adota/features/global/infra/rest_client/rest_client_error.dart';
import 'package:me_adota/features/home/infra/models/city.dart';
import 'package:me_adota/features/home/infra/models/state.dart';

abstract class LocationApiDataSource {
  Future<Either<RestClientError, List<StateModel>>> getStates();

  Future<Either<RestClientError, List<CityModel>>> getCitiesByState(
      StateModel state);
}
