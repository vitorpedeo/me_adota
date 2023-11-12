part of 'app_router.dart';

class AppRoute {
  final String name;
  final String path;

  const AppRoute({
    required this.name,
    required this.path,
  });
}

class AppRoutes {
  // Onboard pages
  static const AppRoute onboard = AppRoute(
    name: 'onboard',
    path: '/onboard',
  );

  // Home pages
  static const AppRoute home = AppRoute(
    name: 'home',
    path: '/home',
  );

  // Search pages
  static const AppRoute search = AppRoute(
    name: 'search',
    path: '/search',
  );

  // Adoptions pages
  static const AppRoute adoptions = AppRoute(
    name: 'adoptions',
    path: '/adoptions',
  );

  // Account pages
  static const AppRoute account = AppRoute(
    name: 'account',
    path: '/account',
  );
  static const AppRoute login = AppRoute(
    name: 'login',
    path: 'login',
  );
  static const AppRoute createAccount = AppRoute(
    name: 'create-account',
    path: 'create-account',
  );
  static const AppRoute createAccountSuccess = AppRoute(
    name: 'create-account-success',
    path: 'create-account-success',
  );
  static const AppRoute forgotPassword = AppRoute(
    name: 'forgot-password',
    path: 'forgot-password',
  );
  static const AppRoute recoverPassword = AppRoute(
    name: 'recover-password',
    path: 'recover-password',
  );
  static const AppRoute recoverPasswordSuccess = AppRoute(
    name: 'recover-password-success',
    path: 'recover-password-success',
  );
  static const AppRoute updateInfo = AppRoute(
    name: 'update-info',
    path: 'update-info',
  );
  static const AppRoute updatePassword = AppRoute(
    name: 'update-password',
    path: 'update-password',
  );
}
