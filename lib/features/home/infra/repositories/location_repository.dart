import 'package:dartz/dartz.dart';
import 'package:me_adota/features/global/infra/rest_client/rest_client_error.dart';
import 'package:me_adota/features/home/domain/entities/state.dart';
import 'package:me_adota/features/home/domain/entities/city.dart';
import 'package:me_adota/features/home/domain/repositories/location_repository.dart';
import 'package:me_adota/features/home/infra/data_sources/location_api_data_source.dart';
import 'package:me_adota/features/home/infra/models/state.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationApiDataSource _locationApiDataSource;

  LocationRepositoryImpl(this._locationApiDataSource);

  @override
  Future<Either<RestClientError, List<StateEntity>>> getStates() async {
    return await _locationApiDataSource.getStates();
  }

  @override
  Future<Either<RestClientError, List<CityEntity>>> getCitiesByState(
      StateEntity state) {
    return _locationApiDataSource.getCitiesByState(
      StateModel.fromEntity(state),
    );
  }
}
