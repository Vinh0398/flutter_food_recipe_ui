import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_ui/cons/colors.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';
import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';

class ShowCategoryItemWidget extends StatelessWidget {
  final FoodEntity foodData;

  const ShowCategoryItemWidget({
    Key? key,
    required this.foodData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.size25,
        right: Dimens.size16,
      ),
      child: SizedBox(
        height: Dimens.size230,
        width: Dimens.size150,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildFoodInfo(
                foodData.title ?? "",
                foodData.meta?.cook.toString() ?? "",
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: _buildFoodImage(foodData.image ?? ""),
            ),
            Positioned(
              top: Dimens.size5,
              left: Dimens.size103,
              child: _buildFoodRate(
                '${foodData.rate}',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodImage(String imageUrl) {
    return Container(
      height: Dimens.size110,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CachedNetworkImage(
        memCacheHeight: Dimens.size110.toInt(),
        memCacheWidth: Dimens.size110.toInt(),
        fit: BoxFit.cover,
        imageUrl: imageUrl,
      ),
    );
  }

  Widget _buildFoodInfo(String foodName, String cookTime) {
    return Container(
      height: Dimens.size175,
      width: Dimens.size150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.size12),
        color: AppColors.itemBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 90,
          left: Dimens.size10,
          right: Dimens.size10,
          bottom: Dimens.size10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: _foodName(foodName),
            ),
            _foodInfo(cookTime),
          ],
        ),
      ),
    );
  }

  Widget _foodName(String foodName) {
    return SizedBox(
      height: Dimens.size40,
      child: Text(
        foodName,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: Dimens.size16,
          color: AppColors.textColor,
        ),
        softWrap: true,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _foodInfo(String cookTime) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.size8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Time',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: Dimens.size11,
              color: AppColors.subTitleColor,
            ),
          ),
          Text(
            '$cookTime Mins',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Dimens.size12,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodRate(String ratePoint) {
    return Container(
      width: Dimens.size45,
      height: Dimens.size23,
      decoration: BoxDecoration(
        color: AppColors.ratingBackgroundColor,
        borderRadius: BorderRadius.circular(Dimens.size20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            size: Dimens.size12,
            color: AppColors.ratingStarColor,
          ),
          Text(
            ratePoint,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: Dimens.size12,
              color: AppColors.ratingTextColor,
            ),
          )
        ],
      ),
    );
  }
}
