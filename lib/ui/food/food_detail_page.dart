import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_recipe_ui/cons/colors.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';
import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';
import 'package:flutter_food_recipe_ui/ui/food/controller/food_detail_cubit.dart';
import 'package:flutter_food_recipe_ui/ui/food/widget/detail_food_image_widget.dart';
import 'package:flutter_food_recipe_ui/ui/food/widget/food_description_widget.dart';
import 'package:provider/provider.dart';

class FoodDetailPage extends StatefulWidget {
  final String? foodId;

  const FoodDetailPage({
    Key? key,
    this.foodId,
  }) : super(key: key);

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  late FoodDetailCubit _foodCubit;

  @override
  void initState() {
    _foodCubit = FoodDetailCubit(getFoodUseCase: context.read());
    _foodCubit.getFoodDetail(foodId: widget.foodId ?? "1");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _foodCubit,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData.fallback().copyWith(
            color: AppColors.titleColor,
          ),
          backgroundColor: AppColors.backgroundColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz_rounded,
              ),
            )
          ],
        ),
        body: BlocBuilder<FoodDetailCubit, FoodDetailState>(
          builder: (context, state) => _buildBodyPage(foodData: state.food),
        ),
      ),
    );
  }

  Widget _buildBodyPage({FoodEntity? foodData}) {
    if (foodData == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.size16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailFoodImageWidget(
              imageUrl: foodData.image ?? "",
              footRatePoint: foodData.rate?.toString() ?? "",
              cookTime: foodData.meta?.cook.toString() ?? "",
            ),
            const SizedBox(
              height: Dimens.size10,
            ),
            _buildFoodTitle(foodData.title ?? ""),
            _buildCookInfor(foodData),
            FoodDescriptionWidget(
                descriptionText: foodData.description ?? ""),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodTitle(String foodName) {
    return Text(
      foodName,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.size20,
        color: AppColors.titleColor,
      ),
    );
  }

  Widget _buildCookInfor(FoodEntity? foodData) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.size10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildMetaFood(
            const Icon(
              Icons.person,
              color: AppColors.subTitleColor,
            ),
            'Serve',
            "${foodData?.meta?.prep.toString()} person",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.size5),
            child: _buildMetaFood(
              const Icon(
                Icons.emoji_food_beverage_rounded,
                color: AppColors.subTitleColor,
              ),
              'Time to prepare',
              "${foodData?.meta?.prep.toString()} mins",
            ),
          ),
          _buildMetaFood(
            const Icon(
              Icons.timer,
              color: AppColors.subTitleColor,
            ),
            'Time to cook',
            "${foodData?.meta?.cook.toString()} mins",
          ),
        ],
      ),
    );
  }

  Widget _buildMetaFood(Icon icon, String title, String subTitle) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.size5),
          child: Text(
            "$title: ",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: Dimens.size14,
              color: AppColors.subTitleColor,
            ),
          ),
        ),
        Text(
          "$subTitle",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: Dimens.size14,
            color: AppColors.subTitleColor,
          ),
        ),
      ],
    );
  }
}
