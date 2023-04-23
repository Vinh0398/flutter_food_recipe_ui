import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_food_recipe_ui/cons/colors.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';
import 'package:flutter_food_recipe_ui/data/category/models/entity/category_entity.dart';
import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/controller/category_controller.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/controller/food_controller.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/controller/home_controller.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/widget/category_chips.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/widget/horizotal_list_food_widget.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/widget/list_food_recommend_widget.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/widget/show_category_item_widget.dart';
import 'package:flutter_food_recipe_ui/ui/home_ui/widget/title_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageCubit homePageCubit;

  @override
  void initState() {
    homePageCubit = HomePageCubit(
      context.read(),
      context.read(),
      context.read(),
    );
    homePageCubit.fetchAllCategories();
    homePageCubit.fetchAllListFood(categoryId: null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homePageCubit,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SafeArea(
              child: TitleWidget(),
            ),
            buildSearchBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: Dimens.size16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildListFood(),
                       const ListFoodRecommendWidget(title: "New Recipes",),
                       const ListFoodRecommendWidget(title: "Food Recommend",),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListFood() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Dimens.size25,
          ),
          child: BlocBuilder<HomePageCubit, HomeState>(
              builder: (context, homeState) {
            final listData = homeState.listCategory;
            return CategoryChip(
              listData: listData,
              onItemPressed: (index, category) {
                context.read<HomePageCubit>().selectedCategory(index: index);
              },
            );
          }),
        ),
        BlocConsumer<HomePageCubit, HomeState>(
          builder: (context, data) {
            if (data.listCategory.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (data.indexCategorySelected == null) {
              return const HorizontalListFoodWidget(categoryId: null);
            }
            if (data.indexCategorySelected == -1) {
              return const HorizontalListFoodWidget(categoryId: null);
            }
            final categoryId =
                data.listCategory[data.indexCategorySelected! - 1].id;
            return HorizontalListFoodWidget(
                key: Key(categoryId?.toString() ?? ""),
                categoryId: categoryId.toString());
          },
          listener: (context, state) => state.indexCategorySelected,
        ),
      ],
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.size30,
        right: Dimens.size10,
        left: Dimens.size16,
      ),
      child: TextField(
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          hintText: 'Search recipe',
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: Dimens.size14,
            color: AppColors.subTitleColor,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.subTitleColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Dimens.size16,
            ),
            borderSide: const BorderSide(
              width: 1.3,
              color: AppColors.itemBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }

/*Widget _buildItemFood(
    BuildContext context,
    int index,
    List<FoodEntity> listData,
  ) {
    final foodData = listData[index];
    return ShowCategoryItemWidget(foodData: foodData);
  }*/
}
