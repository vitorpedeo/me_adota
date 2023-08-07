import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:me_adota/features/global/infra/data_sources/local_data_source.dart';
import 'package:me_adota/features/global/infra/rest_client/rest_client_error.dart';
import 'package:me_adota/features/home/domain/entities/state.dart';
import 'package:me_adota/features/home/domain/entities/city.dart';
import 'package:me_adota/features/home/domain/repositories/location_repository.dart';
import 'package:me_adota/features/home/infra/data_sources/location_api_data_source.dart';
import 'package:me_adota/features/home/infra/models/state.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationApiDataSource _locationApiDataSource;
  final LocalDataSource _localDataSource;

  LocationRepositoryImpl(this._locationApiDataSource, this._localDataSource);

  @override
  Future<Either<RestClientError, List<StateEntity>>> getStates() async {
    return await _locationApiDataSource.getStates();
  }

  @override
  Future<void> setSelectedState(StateEntity state) async {
    final StateModel stateModel = StateModel.fromEntity(state);

    await _localDataSource.setValue<String>(
      Keys.selectedState,
      jsonEncode(
        stateModel.toJson(),
      ),
    );
  }

  @override
  String? getSelectedState() {
    return _localDataSource.getValue<String>(Keys.selectedState);
  }

  @override
  Future<Either<RestClientError, List<CityEntity>>> getCitiesByState(
      StateEntity state) {
    return _locationApiDataSource.getCitiesByState(
      StateModel.fromEntity(state),
    );
  }
}
