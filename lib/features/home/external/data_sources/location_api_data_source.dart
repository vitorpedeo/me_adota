import 'package:dartz/dartz.dart';
import 'package:me_adota/features/global/infra/rest_client/rest_client.dart';
import 'package:me_adota/features/global/infra/rest_client/rest_client_error.dart';
import 'package:me_adota/features/home/infra/data_sources/location_api_data_source.dart';
import 'package:me_adota/features/home/infra/models/state.dart';
import 'package:me_adota/features/home/infra/models/city.dart';

class LocationApiDataSourceImpl implements LocationApiDataSource {
  final RestClient _restClient;
  final String _baseUrl = 'https://servicodados.ibge.gov.br/api/v1';

  LocationApiDataSourceImpl(this._restClient);

  @override
  Future<Either<RestClientError, List<StateModel>>> getStates() async {
    final result = await _restClient.get('$_baseUrl/localidades/estados');

    return result.fold(
      (error) => Left(error),
      (data) {
        final states = (data as List)
            .map<StateModel>((state) => StateModel.fromJson(state))
            .toList();

        states.sort((a, b) => a.name.compareTo(b.name));

        return Right(states);
      },
    );
  }

  @override
  Future<Either<RestClientError, List<CityModel>>> getCitiesByState(
      StateModel state) async {
    final result = await _restClient
        .get('$_baseUrl/localidades/estados/${state.abbreviation}/municipios');

    return result.fold(
      (error) => Left(error),
      (data) {
        final cities = (data as List)
            .map<CityModel>((state) => CityModel.fromJson(state))
            .toList();

        return Right(cities);
      },
    );
  }
}
