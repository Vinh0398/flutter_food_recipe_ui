import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_recipe_ui/cons/colors.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';
import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/routes/route.dart';
import 'package:flutter_food_recipe_ui/ui/food/all_foods_page.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/controller/food_controller.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/widget/recommend_food_item_widget.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/widget/show_all_btn_widget.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/widget/show_category_item_widget.dart';
import 'package:go_router/go_router.dart';

class ListFoodRecommendWidget extends StatefulWidget {
  final String title;

  const ListFoodRecommendWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ListFoodRecommendWidget> createState() =>
      _ListFoodRecommendWidgetState();
}

class _ListFoodRecommendWidgetState extends State<ListFoodRecommendWidget> {
  late FoodListCubit _foodCubit;

  @override
  void initState() {
    _foodCubit = FoodListCubit([], context.read(), context.read());
    _foodCubit.fetchAllListFood(categoryId: null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _foodCubit,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(),
          _buildListFood(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.size16),
      child: Row(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Dimens.size20,
              color: AppColors.titleColor,
            ),
          ),
          const Spacer(),
          ShowAllBtnWidget(
            onPress: _onPressShowAll,
          ),
        ],
      ),
    );
  }

  Widget _buildListFood() {
    return BlocBuilder<FoodListCubit, List<FoodEntity>>(
      builder: (context, data) => _listFoodBuilder(context, data),
    );
  }

  Widget _listFoodBuilder(
    BuildContext context,
    List<FoodEntity> listFood,
  ) {
    if (listFood.isEmpty) {
      return const SizedBox.shrink();
    }
    final recommendFood =
        listFood.where((element) => element.rate! >= 4).toList();
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.size10,
      ),
      child: SizedBox(
        height: Dimens.size150,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildItemFood(
              context,
              index,
              recommendFood,
            );
          },
          padding: const EdgeInsets.symmetric(horizontal: Dimens.size16),
          separatorBuilder: (_, __) => const SizedBox(width: Dimens.size8),
        ),
      ),
    );
  }

  Widget _buildItemFood(
    BuildContext context,
    int index,
    List<FoodEntity> listData,
  ) {
    final foodData = listData[index];
    return RecommendItemFoodWidget(foodData: foodData);
  }

  void _onPressShowAll() {
    var argumentsPath = "";
    if (widget.title.startsWith("Food")) {
      argumentsPath = AllFoodsDisplayType.recommend.name;
    } else {
      argumentsPath = AllFoodsDisplayType.newRecipe.name;
    }
    final path =
        "${GoRouter.of(context).location}/${RoutePath.allFoodPath}/$argumentsPath";
    final uri = Uri(
      path: path,
    ).toString();
    context.go(uri);
  }
}
