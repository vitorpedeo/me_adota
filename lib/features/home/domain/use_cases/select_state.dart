import 'package:me_adota/features/home/domain/entities/state.dart';
import 'package:me_adota/features/home/domain/repositories/location_repository.dart';

class SelectStateUseCase {
  final LocationRepository _locationRepository;

  SelectStateUseCase(this._locationRepository);

  Future<void> call(StateEntity state) async {
    await _locationRepository.setSelectedState(state);
  }
}
