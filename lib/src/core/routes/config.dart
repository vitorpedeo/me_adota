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
}
