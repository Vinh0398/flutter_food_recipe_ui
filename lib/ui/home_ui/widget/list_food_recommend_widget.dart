import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_recipe_ui/cons/colors.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';
import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/controller/food_controller.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/widget/recommend_food_item_widget.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/widget/show_category_item_widget.dart';

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
      child: Padding(
        padding: const EdgeInsets.only(
          top: Dimens.size20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: Dimens.size20),
            _buildTitle(),
            _buildListFood(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.size20,
        color: AppColors.titleColor,
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
      return SizedBox.shrink();
    }
    final recommendFood =
        listFood.where((element) => element.rate! >= 4).toList();
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.size10,
      ),
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildItemFood(
              context,
              index,
              recommendFood,
            );
          },
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
}
