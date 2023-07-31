import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/global/infra/data_sources/local_data_source.dart';
import 'package:me_adota/features/global/presentation/widgets/scaffold_with_bottom_bar/scaffold_with_bottom_bar.dart';
import 'package:me_adota/features/onboard/presentation/pages/onboard_page.dart';

part 'app_routes.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter getRouter() {
    final bool isFirstTime =
        getIt<LocalDataSource>().getValue<bool>(Keys.isFirstTime) ?? true;
    final String initialLocation =
        isFirstTime ? AppRoutes.onboard.path : AppRoutes.home.path;

    return GoRouter(
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          name: AppRoutes.onboard.name,
          path: AppRoutes.onboard.path,
          builder: (context, state) => const OnboardPage(),
        ),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return ScaffoldWithBottomBar(
              child: child,
            );
          },
          routes: [
            GoRoute(
              name: AppRoutes.home.name,
              path: AppRoutes.home.path,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Scaffold(
                  backgroundColor: Color(0xFFFAFAFA),
                  body: SafeArea(
                    child: Center(
                      child: Text('Home Page!'),
                    ),
                  ),
                ),
              ),
            ),
            // GoRoute(
            //   name: AppRoutes.search.name,
            //   path: AppRoutes.search.path,
            //   parentNavigatorKey: _shellNavigatorKey,
            //   pageBuilder: (context, state) => const NoTransitionPage(
            //     child: SearchPage(),
            //   ),
            // ),
            // GoRoute(
            //   name: AppRoutes.adoptions.name,
            //   path: AppRoutes.adoptions.path,
            //   parentNavigatorKey: _shellNavigatorKey,
            //   pageBuilder: (context, state) => const NoTransitionPage(
            //     child: AdoptionsPage(),
            //   ),
            // ),
            // GoRoute(
            //   name: AppRoutes.account.name,
            //   path: AppRoutes.account.path,
            //   parentNavigatorKey: _shellNavigatorKey,
            //   pageBuilder: (context, state) => const NoTransitionPage(
            //     child: AccountPage(),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
