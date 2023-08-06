import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/config/routes/app_router.dart';
import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/home/presentation/cubits/states_list/states_list_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StatesListCubit>(
          create: (_) => getIt(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Me Adota',
        routerConfig: AppRouter.getRouter(),
      ),
    );
  }
}
