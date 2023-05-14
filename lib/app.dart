import 'package:flutter/material.dart';
import 'package:me_adota/providers.dart';
import 'package:me_adota/src/core/routes/routes.dart';
import 'package:me_adota/src/core/services/local_storage_service.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(
        '[LOCAL_STORAGE] ${LocalStorageService.getBool('@me_adota:is_first_time')}');

    return MultiProvider(
      providers: AppProviders.all,
      child: MaterialApp.router(
        title: 'Me Adota',
        routerConfig: AppRouter.router,
      ),
    );
  }
}
