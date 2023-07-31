import 'package:me_adota/features/onboard/domain/repositories/onboard_repository.dart';

class FinishOnboardUseCase {
  final OnboardRepository _repository;

  const FinishOnboardUseCase(this._repository);

  Future<void> call() async {
    await _repository.finishOnboard();
  }
}
