import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_ui/data/category/models/injector.dart';
import 'package:flutter_food_recipe_ui/data/food/injector.dart';
import 'package:flutter_food_recipe_ui/data/injector.dart';
import 'package:flutter_food_recipe_ui/domain/category/injector.dart';
import 'package:flutter_food_recipe_ui/domain/food/injector.dart';
import 'package:flutter_food_recipe_ui/routes/route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
     MultiProvider(
      providers: [
        dioProvider,
        ...categoryRepositoriesProviders,
        ...foodRepositoriesProviders,
        ...categoryUseCaseProviders,
        ...foodUseCaseProviders
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
