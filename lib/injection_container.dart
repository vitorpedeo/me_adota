import 'package:me_adota/features/global/external/global_dependency_injection.dart';
import 'package:me_adota/features/onboard/external/onboard_dependency_injection.dart';

injectDependencies() {
  OnboardDependencyInjection().inject();
  GlobalDependencyInjection().inject();
}
