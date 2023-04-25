
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_recipe_ui/cons/colors.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';
import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/routes/route.dart';
import 'package:flutter_food_recipe_ui/ui/food/widget/square_item_food.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/controller/food_controller.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/home_page.dart';
import 'package:go_router/go_router.dart';

enum AllFoodsDisplayType {
  category,
  newRecipe,
  recommend,
}

class AllFoodsPage extends StatefulWidget {
  final String? categoryId;
  final String? categoryName;
  final AllFoodsDisplayType displayType;

  const AllFoodsPage({
    Key? key,
    this.categoryId,
    this.categoryName,
    required this.displayType,
  }) : super(key: key);

  @override
  State<AllFoodsPage> createState() => _AllFoodsPageState();
}

class _AllFoodsPageState extends State<AllFoodsPage> {
  late FoodListCubit _foodCubit;

  String _titlePageByType(BuildContext context) {
    switch (widget.displayType) {
      case AllFoodsDisplayType.category:
        return widget.categoryName ?? "Foods";
      case AllFoodsDisplayType.newRecipe:
        return "New Recipes Foods";
      case AllFoodsDisplayType.recommend:
        return "Recommend Foods";
    }
  }

  @override
  void initState() {
    _foodCubit = FoodListCubit([], context.read(), context.read());
    _fetchFoods();
    super.initState();
  }

  void _fetchFoods() {
    switch (widget.displayType) {
      case AllFoodsDisplayType.category:
        _foodCubit.fetchAllListFood(categoryId: widget.categoryId);
        break;
      case AllFoodsDisplayType.newRecipe:
        _foodCubit.fetchNewRecipeFoods();
        break;
      case AllFoodsDisplayType.recommend:
        _foodCubit.fetchRecommendFoods();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _foodCubit,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          iconTheme: const IconThemeData.fallback().copyWith(
            color: Colors.black,
          ),
          backgroundColor: AppColors.backgroundColor,
          title: Text(_titlePageByType(context), style: const TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: _buildBodyPage(),
      ),
    );
  }

  Widget _buildBodyPage() {
    return Column(
      children: [
        const AppSearchBarWidget(),
        const SizedBox(height: Dimens.size4,),
        Expanded(child: _buildListSearch()),
      ],
    );
  }

  Widget _buildListSearch() {
    return BlocBuilder<FoodListCubit, List<FoodEntity>>(
      builder: (context, listFood) {
        if (listFood.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        var gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: Dimens.size16,
          crossAxisSpacing: Dimens.size16,
        );
        return GridView.builder(
          itemCount: listFood.length,
          gridDelegate: gridDelegate,
          itemBuilder: (context, index) => SquareItemFood(
            index: index,
            data: listFood[index],
            onItemPressed: _onItemFoodPressed,
          ),
          padding: const EdgeInsets.all(Dimens.size16),
        );
      },
    );
  }


  void _onItemFoodPressed(int index, FoodEntity data) {
    final currentLocation = GoRouter.of(context).location;
    context.go("$currentLocation/${RoutePath.detailFoodPath}/${data.id}");
  }
}


