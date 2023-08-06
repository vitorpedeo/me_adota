import 'package:dartz/dartz.dart';
import 'package:me_adota/features/global/infra/rest_client/rest_client_error.dart';
import 'package:me_adota/features/home/domain/entities/state.dart';
import 'package:me_adota/features/home/domain/repositories/location_repository.dart';

class FetchStatesUseCase {
  final LocationRepository _locationRepository;

  FetchStatesUseCase(this._locationRepository);

  Future<Either<RestClientError, List<StateEntity>>> call() async {
    return await _locationRepository.getStates();
  }
}
