import 'package:flutter_food_recipe_ui/data/food/data_source/food_local_data_source.dart';
import 'package:flutter_food_recipe_ui/data/food/data_source/food_remote_data_source.dart';
import 'package:flutter_food_recipe_ui/data/food/data_source/food_retrofit.dart';
import 'package:provider/provider.dart';
import 'respository/food_respository.dart';

final foodRepositoriesProviders = [
  Provider<FoodRetrofit>(
    create: (context) => FoodRetrofit(context.read()),
  ),
  Provider<FoodRemoteDataSource>(
    create: (context) => FoodRemoteDataSource(context.read()),
  ),
  Provider<FoodLocalDataSource>(
    create: (context) => FoodLocalDataSource(),
  ),
  Provider<FoodRepository>(
    create: (context) => FoodRepository(
      remoteDataSource: context.read<FoodRemoteDataSource>(),
      localDataSource: context.read<FoodLocalDataSource>(),
    ),
  ),
];

