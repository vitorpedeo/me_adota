class AppRouteConfig {
  final String name;
  final String path;

  const AppRouteConfig({
    required this.name,
    required this.path,
  });
}

class AppRoutesConfig {
  static const AppRouteConfig onboard = AppRouteConfig(
    name: 'onboard',
    path: '/onboard',
  );
  static const AppRouteConfig home = AppRouteConfig(
    name: 'home',
    path: '/home',
  );
  static const AppRouteConfig search = AppRouteConfig(
    name: 'search',
    path: '/search',
  );
  static const AppRouteConfig adoptions = AppRouteConfig(
    name: 'adoptions',
    path: '/adoptions',
  );
  static const AppRouteConfig account = AppRouteConfig(
    name: 'account',
    path: '/account',
  );
}
