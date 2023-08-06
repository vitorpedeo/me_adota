import 'package:me_adota/features/global/external/global_dependency_injection.dart';
import 'package:me_adota/features/home/external/home_dependency_injection.dart';
import 'package:me_adota/features/onboard/external/onboard_dependency_injection.dart';

Future<void> injectDependencies() async {
  await GlobalDependencyInjection().inject();
  await OnboardDependencyInjection().inject();
  await HomeDependencyInjection().inject();
}
