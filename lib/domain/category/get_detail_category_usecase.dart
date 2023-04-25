import 'package:flutter_food_recipe_ui/data/category/models/entity/category_entity.dart';
import 'package:flutter_food_recipe_ui/data/category/repository/category_repository.dart';
import 'package:flutter_food_recipe_ui/domain/base_use_case.dart';

class GetDetailCategoryUseCase extends BaseUseCase<CategoryEntity?, String?> {
  final CategoryRepository categoryRepository;

  GetDetailCategoryUseCase({required this.categoryRepository});

  @override
  Future<CategoryEntity?> invoke({required String? param}) async {
    final result =
        await categoryRepository.getCategoryDetailById(categoryId: param);
    return result;
  }
}
