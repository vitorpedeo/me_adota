import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/src/core/routes/config.dart';
import 'package:me_adota/src/core/services/local_storage_service.dart';
import 'package:me_adota/src/modules/account/pages/account_page.dart';
import 'package:me_adota/src/modules/adoptions/pages/adoptions_page.dart';
import 'package:me_adota/src/modules/home/pages/home_page.dart';
import 'package:me_adota/src/modules/onboard/pages/onboard_page.dart';
import 'package:me_adota/src/modules/search/pages/search_page.dart';
import 'package:me_adota/src/shared/widgets/app_scaffold_with_navbar/app_scaffold_with_navbar.dart';

// TODO: Check why global key error is happening when using root navigator key

// final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter getRouter() {
    final bool isFirstTime =
        LocalStorageService.getBool(Keys.isFirstTime) ?? true;
    final String initialLocation =
        isFirstTime ? AppRoutesConfig.onboard.path : AppRoutesConfig.home.path;

    return GoRouter(
      initialLocation: initialLocation,
      // navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          name: AppRoutesConfig.onboard.name,
          path: AppRoutesConfig.onboard.path,
          // parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const OnboardPage(),
        ),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return AppScaffoldWithNavbar(
              child: child,
            );
          },
          routes: [
            GoRoute(
              name: AppRoutesConfig.home.name,
              path: AppRoutesConfig.home.path,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomePage(),
              ),
            ),
            GoRoute(
              name: AppRoutesConfig.search.name,
              path: AppRoutesConfig.search.path,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SearchPage(),
              ),
            ),
            GoRoute(
              name: AppRoutesConfig.adoptions.name,
              path: AppRoutesConfig.adoptions.path,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AdoptionsPage(),
              ),
            ),
            GoRoute(
              name: AppRoutesConfig.account.name,
              path: AppRoutesConfig.account.path,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AccountPage(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
