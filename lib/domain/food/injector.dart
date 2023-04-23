import 'package:flutter_food_recipe_ui/domain/food/get_all_food_use_case.dart';
import 'package:flutter_food_recipe_ui/domain/food/get_list_food_use_case.dart';
import 'package:provider/provider.dart';

final foodUseCaseProviders = [
  Provider<GetAllFoodUseCase>(
    create: (context) => GetAllFoodUseCase(
      foodRepository: context.read(),
    ),
  ),
  Provider<GetListFoodUseCase>(
    create: (context) => GetListFoodUseCase(
      repository: context.read(),
    ),
  ),
];
