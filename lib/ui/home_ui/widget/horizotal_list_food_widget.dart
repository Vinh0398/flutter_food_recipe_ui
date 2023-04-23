import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';
import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/controller/food_controller.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/widget/show_category_item_widget.dart';

class HorizontalListFoodWidget extends StatefulWidget {
  const HorizontalListFoodWidget({Key? key, required this.categoryId})
      : super(key: key);
  final String? categoryId;

  @override
  State<HorizontalListFoodWidget> createState() =>
      _HorizontalListFoodWidgetState();
}

class _HorizontalListFoodWidgetState extends State<HorizontalListFoodWidget> {
  late FoodListCubit _foodCubit;

  @override
  void initState() {
    _foodCubit = FoodListCubit([], context.read(), context.read());
    _foodCubit.fetchAllListFood(categoryId: widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      key: widget.key,
      value: _foodCubit,
      child: SizedBox(
        height: Dimens.size230,
        child: _buildListFoodBuilder(),
      ),
    );
  }

  Widget _buildListFoodBuilder() {
    return BlocBuilder<FoodListCubit, List<FoodEntity>>(
      key: widget.key,
      builder: (context, data) {
        final _listFood = data;
        if (_listFood.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) => _buildItemFood(
            context,
            index,
            _listFood,
          ),
          itemCount: min(data.length, 5),
          scrollDirection: Axis.horizontal,
        );
      },
    );
  }

  Widget _buildItemFood(
    BuildContext context,
    int index,
    List<FoodEntity> listData,
  ) {
    final foodData = listData[index];
    return ShowCategoryItemWidget(foodData: foodData);
  }
}
