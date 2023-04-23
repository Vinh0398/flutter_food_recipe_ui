import 'package:flutter_food_recipe_ui/data/category/models/entity/category_entity.dart';
import 'package:flutter_food_recipe_ui/data/category/repository/category_repository.dart';

class CategoryLocalDataSource implements CategoryDataSource {
  @override
  Future<CategoryEntity> getCategoryDetailById({required String? categoryId}) {
    // TODO: implement getCategoryDetailById
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryEntity>> getListCategory() {
    // TODO: implement getListCategory
    throw UnimplementedError();
  }
}
