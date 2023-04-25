import 'package:flutter_food_recipe_ui/data/category/models/entity/category_entity.dart';
import 'package:flutter_food_recipe_ui/data/category/repository/category_repository.dart';
import 'package:flutter_food_recipe_ui/domain/base_use_case.dart';

class GetAllCategoryUseCase extends BaseUseCase<List<CategoryEntity>, void> {
  final CategoryRepository categoryRepository;

  GetAllCategoryUseCase({required this.categoryRepository});

  @override
  Future<List<CategoryEntity>> invoke({required void param}) async {
    final result = await categoryRepository.getListCategory();
    return result;
  }
}
