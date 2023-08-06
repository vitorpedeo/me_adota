import 'package:dartz/dartz.dart';
import 'package:me_adota/features/global/infra/rest_client/rest_client_error.dart';
import 'package:me_adota/features/home/domain/entities/city.dart';
import 'package:me_adota/features/home/domain/entities/state.dart';
import 'package:me_adota/features/home/domain/repositories/location_repository.dart';

class FetchCitiesUseCase {
  final LocationRepository _locationRepository;

  FetchCitiesUseCase(this._locationRepository);

  Future<Either<RestClientError, List<CityEntity>>> call(
      StateEntity state) async {
    return await _locationRepository.getCitiesByState(state);
  }
}
