import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/ui/food/all_foods_page.dart';
import 'package:flutter_food_recipe_ui/ui/food/food_detail_page.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/home_page.dart';
import 'package:go_router/go_router.dart';

class RoutePath {
  RoutePath._();

  static const homePath = "/home";
  static const allFoodPath = "allFood";
  static const detailFoodPath = "detailFood";
}

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RoutePath.homePath,
  routes: [
    _homeRoute,
  ],
);

final _homeRoute = GoRoute(
  path: RoutePath.homePath,
  builder: (context, state) => const HomePage(),
  routes: [
    GoRoute(
      path: "${RoutePath.allFoodPath}/:disPlayType",
      builder: (context, state) {
        final displayType = state.params['disPlayType'];
        final categoryId = state.queryParams['categoryId'];
        final categoryName = state.queryParams['categoryName'];
        return AllFoodsPage(
          displayType: AllFoodsDisplayType.values.byName(displayType!),
          categoryId: categoryId,
          categoryName: categoryName,
        );
      },
      routes: [
        GoRoute(
          path: "${RoutePath.detailFoodPath}/:foodId",
          builder: (context, state) {
            final foodId = state.params['foodId'];
            return FoodDetailPage(foodId: foodId);
          },
        ),
      ],
    ),
    GoRoute(
      path: "${RoutePath.detailFoodPath}/:foodId",
      builder: (context, state) {
        final foodId = state.params['foodId'];
        return FoodDetailPage(foodId: foodId);
      },
    )
  ],
);
