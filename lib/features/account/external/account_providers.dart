import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/account/presentation/cubits/account/account_cubit.dart';
import 'package:me_adota/features/account/presentation/cubits/my_pets/my_pets_cubit.dart';

class AccountProviders {
  static final all = [
    BlocProvider<AccountCubit>(
      create: (_) => getIt()..getUserDetails(),
    ),
    BlocProvider<MyPetsCubit>(
      create: (_) => getIt()..loadPets(),
    ),
  ];
}
