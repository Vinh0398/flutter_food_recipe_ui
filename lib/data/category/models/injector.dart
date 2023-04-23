import 'package:flutter_food_recipe_ui/data/category/data_source/category_local_data_source.dart';
import 'package:flutter_food_recipe_ui/data/category/data_source/category_remote_data_source.dart';
import 'package:flutter_food_recipe_ui/data/category/data_source/category_retrofit.dart';
import 'package:flutter_food_recipe_ui/data/category/repository/category_repository.dart';
import 'package:provider/provider.dart';

final categoryRepositoriesProviders = [
  Provider<CategoryRetrofit>(
    create: (context) => CategoryRetrofit(context.read()),
  ),
  Provider<CategoryRemoteDataSource>(
    create: (context) => CategoryRemoteDataSource(context.read()),
  ),
  Provider<CategoryLocalDataSource>(
      create: (context) => CategoryLocalDataSource()),
  Provider<CategoryRepository>(
    create: (context) => CategoryRepository(
      remoteDataSource: context.read<CategoryRemoteDataSource>(),
      localDataSource: context.read<CategoryLocalDataSource>(),
    ),
  ),
];
