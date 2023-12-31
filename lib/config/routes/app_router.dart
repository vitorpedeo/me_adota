import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_adota/core/dependency_injection/dependency_injection.dart';
import 'package:me_adota/features/account/presentation/pages/account/account_page.dart';
import 'package:me_adota/features/account/presentation/pages/account/logged/create_pet/create_pet_page.dart';
import 'package:me_adota/features/account/presentation/pages/account/logged/create_pet/create_pet_page_success.dart';
import 'package:me_adota/features/account/presentation/pages/account/logged/my_pets_page.dart';
import 'package:me_adota/features/account/presentation/pages/account/logged/update_info_page.dart';
import 'package:me_adota/features/account/presentation/pages/account/logged/update_password_page.dart';
import 'package:me_adota/features/account/presentation/pages/create_account/create_account_page.dart';
import 'package:me_adota/features/account/presentation/pages/create_account/create_account_success_page.dart';
import 'package:me_adota/features/account/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:me_adota/features/account/presentation/pages/login_page.dart';
import 'package:me_adota/features/account/presentation/pages/forgot_password/recover_password_page.dart';
import 'package:me_adota/features/account/presentation/pages/forgot_password/recover_password_success_page.dart';
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
                  routes: [
                    GoRoute(
                      parentNavigatorKey: rootNavigatorKey,
                      name: AppRoutes.createAccountSuccess.name,
                      path: AppRoutes.createAccountSuccess.path,
                      builder: (context, state) =>
                          const CreateAccountSuccessPage(),
                    ),
                  ],
                ),
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: AppRoutes.login.name,
                  path: AppRoutes.login.path,
                  builder: (context, state) => const LoginPage(),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: rootNavigatorKey,
                      name: AppRoutes.forgotPassword.name,
                      path: AppRoutes.forgotPassword.path,
                      builder: (context, state) => const ForgotPasswordPage(),
                      routes: [
                        GoRoute(
                          parentNavigatorKey: rootNavigatorKey,
                          name: AppRoutes.recoverPassword.name,
                          path: AppRoutes.recoverPassword.path,
                          builder: (context, state) =>
                              const RecoverPasswordPage(),
                          routes: [
                            GoRoute(
                              parentNavigatorKey: rootNavigatorKey,
                              name: AppRoutes.recoverPasswordSuccess.name,
                              path: AppRoutes.recoverPasswordSuccess.path,
                              builder: (context, state) =>
                                  const RecoverPasswordSuccessPage(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: AppRoutes.updateInfo.name,
                  path: AppRoutes.updateInfo.path,
                  builder: (context, state) => const UpdateInfoPage(),
                ),
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: AppRoutes.updatePassword.name,
                  path: AppRoutes.updatePassword.path,
                  builder: (context, state) => const UpdatePasswordPage(),
                ),
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: AppRoutes.createPet.name,
                  path: AppRoutes.createPet.path,
                  builder: (context, state) => const CreatePetPage(),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: rootNavigatorKey,
                      name: AppRoutes.createPetSuccess.name,
                      path: AppRoutes.createPetSuccess.path,
                      builder: (context, state) => const CreatePetSuccessPage(),
                    ),
                  ],
                ),
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: AppRoutes.myPets.name,
                  path: AppRoutes.myPets.path,
                  builder: (context, state) => const MyPetsPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
