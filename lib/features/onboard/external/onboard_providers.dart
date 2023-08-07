import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/onboard/presentation/cubits/onboard/onboard_cubit.dart';

class OnboardProviders {
  static final all = [
    BlocProvider<OnboardCubit>(
      create: (_) => getIt(),
    ),
  ];
}
