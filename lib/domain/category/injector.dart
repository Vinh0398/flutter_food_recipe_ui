import 'package:flutter_food_recipe_ui/domain/category/get_all_category_use_case.dart';
import 'package:flutter_food_recipe_ui/domain/category/get_detail_category_usecase.dart';
import 'package:provider/provider.dart';

final categoryUseCaseProviders = [
  Provider<GetAllCategoryUseCase>(
    create: (context) => GetAllCategoryUseCase(
      categoryRepository: context.read(),
    ),
  ),
  Provider<GetDetailCategoryUseCase>(
    create: (context) => GetDetailCategoryUseCase(
      categoryRepository: context.read(),
    ),
  ),
];
