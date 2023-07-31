import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/onboard/domain/repositories/onboard_repository.dart';
import 'package:me_adota/features/onboard/domain/use_cases/finish_onboard.dart';
import 'package:me_adota/features/onboard/infra/repositories/onboard_repository.dart';
import 'package:me_adota/features/onboard/presentation/cubits/onboard/onboard_cubit.dart';

class OnboardDependencyInjection implements DependencyInjection {
  @override
  Future<void> inject() async {
    // Repositories
    getIt.registerSingleton<OnboardRepository>(OnboardRepositoryImpl(getIt()));

    // Use cases
    getIt
        .registerSingleton<FinishOnboardUseCase>(FinishOnboardUseCase(getIt()));

    // Cubits
    getIt.registerFactory<OnboardCubit>(() => OnboardCubit(getIt()));
  }
}
