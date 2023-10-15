import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_adota/config/routes/app_router.dart';
import 'package:me_adota/features/account/external/account_providers.dart';
import 'package:me_adota/features/home/external/home_providers.dart';
import 'package:me_adota/features/onboard/external/onboard_providers.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...OnboardProviders.all,
        ...HomeProviders.all,
        ...AccountProviders.all,
      ],
      child: MaterialApp.router(
        title: 'Me Adota',
        routerConfig: AppRouter.getRouter(),
      ),
    );
  }
}
