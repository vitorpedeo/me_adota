import 'package:me_adota/features/home/domain/repositories/location_repository.dart';

class GetSelectedStateUseCase {
  final LocationRepository _locationRepository;

  GetSelectedStateUseCase(this._locationRepository);

  String? call() {
    return _locationRepository.getSelectedState();
  }
}
