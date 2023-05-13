import 'package:go_router/go_router.dart';
import 'package:me_adota/src/core/routes/names.dart';
import 'package:me_adota/src/modules/onboard/pages/onboard_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.onboard,
    routes: [
      GoRoute(
        path: RouteNames.onboard,
        builder: (context, state) => const OnboardPage(),
      ),
    ],
  );
}
