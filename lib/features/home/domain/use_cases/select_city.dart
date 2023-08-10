import 'package:me_adota/features/home/domain/entities/city.dart';
import 'package:me_adota/features/home/domain/repositories/location_repository.dart';

class SelectCityUseCase {
  final LocationRepository _locationRepository;

  SelectCityUseCase(this._locationRepository);

  Future<void> call(CityEntity city) async {
    await _locationRepository.setSelectedCity(city);
  }
}
