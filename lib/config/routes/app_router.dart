import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/account/presentation/pages/account_page.dart';
import 'package:me_adota/features/account/presentation/pages/create_account_page.dart';
import 'package:me_adota/features/account/presentation/pages/login_page.dart';
import 'package:me_adota/features/global/infra/data_sources/local_data_source.dart';
import 'package:me_adota/features/global/presentation/widgets/layout/scaffold_with_bottom_bar/scaffold_with_bottom_bar.dart';
import 'package:me_adota/features/home/presentation/pages/home_page.dart';
import 'package:me_adota/features/onboard/presentation/pages/onboard_page.dart';

part 'app_routes.dart';

class AppRouter {
  static GoRouter getRouter() {
    final bool isFirstTime =
        getIt<LocalDataSource>().getValue<bool>(Keys.isFirstTime) ?? true;
    final String initialLocation =
        isFirstTime ? AppRoutes.onboard.path : AppRoutes.home.path;

    final rootNavigatorKey = GlobalKey<NavigatorState>(
      debugLabel: 'root',
    );
    final shellNavigatorKey = GlobalKey<NavigatorState>(
      debugLabel: 'shell',
    );

    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          name: AppRoutes.onboard.name,
          path: AppRoutes.onboard.path,
          builder: (context, state) => const OnboardPage(),
        ),
        ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) {
            return ScaffoldWithBottomBar(
              child: child,
            );
          },
          routes: [
            GoRoute(
              parentNavigatorKey: shellNavigatorKey,
              name: AppRoutes.home.name,
              path: AppRoutes.home.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomePage(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: shellNavigatorKey,
              name: AppRoutes.account.name,
              path: AppRoutes.account.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AccountPage(),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: AppRoutes.createAccount.name,
                  path: AppRoutes.createAccount.path,
                  builder: (context, state) => const CreateAccountPage(),
                ),
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: AppRoutes.login.name,
                  path: AppRoutes.login.path,
                  builder: (context, state) => const LoginPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
