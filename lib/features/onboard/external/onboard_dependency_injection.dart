import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/onboard/presentation/cubits/onboard/onboard_cubit.dart';

class OnboardDependencyInjection implements DependencyInjection {
  @override
  void inject() {
    // Cubits
    getIt.registerFactory<OnboardCubit>(() => OnboardCubit());
  }
}
