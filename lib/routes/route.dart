import 'package:flutter_food_recipe_ui/ui/home_ui/home_page.dart';
import 'package:go_router/go_router.dart';

class RoutePath {
  RoutePath._();

  static const homePath = "/home";
}

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RoutePath.homePath,
  routes: [
    _homeRoute(),
  ],
);

GoRoute _homeRoute() {
  return GoRoute(
    path: RoutePath.homePath,
    builder: (context, state) => const HomePage(),
  );
}
