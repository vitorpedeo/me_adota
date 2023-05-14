import 'package:go_router/go_router.dart';
import 'package:me_adota/src/core/routes/config.dart';
import 'package:me_adota/src/core/services/local_storage_service.dart';
import 'package:me_adota/src/modules/home/pages/home_page.dart';
import 'package:me_adota/src/modules/onboard/pages/onboard_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutesConfig.onboard.path,
    routes: [
      GoRoute(
        name: AppRoutesConfig.onboard.name,
        path: AppRoutesConfig.onboard.path,
        builder: (context, state) => const OnboardPage(),
      ),
      GoRoute(
        name: AppRoutesConfig.home.name,
        path: AppRoutesConfig.home.path,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );

  static GoRouter getRouter() {
    final bool isFirstTime =
        LocalStorageService.getBool(Keys.isFirstTime) ?? true;
    final String initialLocation =
        isFirstTime ? AppRoutesConfig.onboard.path : AppRoutesConfig.home.path;

    return GoRouter(
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          name: AppRoutesConfig.onboard.name,
          path: AppRoutesConfig.onboard.path,
          builder: (context, state) => const OnboardPage(),
        ),
        GoRoute(
          name: AppRoutesConfig.home.name,
          path: AppRoutesConfig.home.path,
          builder: (context, state) => const HomePage(),
        ),
      ],
    );
  }
}
