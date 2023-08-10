import 'package:me_adota/features/home/domain/repositories/location_repository.dart';

class GetSelectedCityUseCase {
  final LocationRepository _locationRepository;

  GetSelectedCityUseCase(this._locationRepository);

  String? call() {
    return _locationRepository.getSelectedCity();
  }
}
