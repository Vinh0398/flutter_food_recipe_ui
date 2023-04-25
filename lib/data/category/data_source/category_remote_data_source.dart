import 'package:flutter_food_recipe_ui/data/category/data_source/category_retrofit.dart';
import 'package:flutter_food_recipe_ui/data/category/models/entity/category_entity.dart';
import 'package:flutter_food_recipe_ui/data/category/repository/category_repository.dart';

class CategoryRemoteDataSource implements CategoryDataSource {
  final CategoryRetrofit categoryRetrofit;

  CategoryRemoteDataSource(this.categoryRetrofit);

  @override
  Future<CategoryEntity?> getCategoryDetailById(
      {required String? categoryId}) async {
    var res = await categoryRetrofit.getCategoryDetailById(categoryId!);
    return res.data;
  }

  @override
  Future<List<CategoryEntity>> getListCategory() async {
    var res = await categoryRetrofit.getListCategory();
    return res.data ?? [];
  }
}
