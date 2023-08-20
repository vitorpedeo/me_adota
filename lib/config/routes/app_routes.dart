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
  static const AppRoute onboard = AppRoute(
    name: 'onboard',
    path: '/onboard',
  );
  static const AppRoute home = AppRoute(
    name: 'home',
    path: '/home',
  );
  static const AppRoute search = AppRoute(
    name: 'search',
    path: '/search',
  );
  static const AppRoute adoptions = AppRoute(
    name: 'adoptions',
    path: '/adoptions',
  );
  static const AppRoute account = AppRoute(
    name: 'account',
    path: '/account',
  );
  static const AppRoute login = AppRoute(
    name: 'login',
    path: 'login',
  );
}
