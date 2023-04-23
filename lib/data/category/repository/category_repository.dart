import 'package:flutter_food_recipe_ui/data/category/models/entity/category_entity.dart';

abstract class CategoryDataSource {
  ///get list category
  Future<List<CategoryEntity>> getListCategory();

  ///get category detail with [categoryId] can not null
  Future<CategoryEntity?> getCategoryDetailById({required String? categoryId});
}

class CategoryRepository implements CategoryDataSource {
  final CategoryDataSource remoteDataSource;
  final CategoryDataSource localDataSource;

  CategoryRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<CategoryEntity?> getCategoryDetailById({required String? categoryId}) {
    return remoteDataSource.getCategoryDetailById(categoryId: categoryId);
  }

  @override
  Future<List<CategoryEntity>> getListCategory() {
    return remoteDataSource.getListCategory();
  }
}
