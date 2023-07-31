import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

abstract class DependencyInjection {
  Future<void> inject();
}
