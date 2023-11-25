import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/account/domain/repositories/account_repository.dart';
import 'package:me_adota/features/account/domain/use_cases/get_user_details.dart';
import 'package:me_adota/features/account/domain/use_cases/login.dart';
import 'package:me_adota/features/account/infra/repositories/account_repository.dart';
import 'package:me_adota/features/account/presentation/cubits/account/account_cubit.dart';
import 'package:me_adota/features/account/presentation/cubits/my_pets/my_pets_cubit.dart';

class AccountDependencyInjection implements DependencyInjection {
  @override
  Future<void> inject() async {
    // Repositories
    getIt.registerSingleton<AccountRepository>(AccountRepositoryImpl(getIt()));

    // Use cases
    getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt()));
    getIt.registerSingleton<GetUserDetailsUseCase>(
        GetUserDetailsUseCase(getIt()));

    // Cubits
    getIt.registerFactory<AccountCubit>(() => AccountCubit(getIt(), getIt()));
    getIt.registerFactory<MyPetsCubit>(() => MyPetsCubit());
  }
}
