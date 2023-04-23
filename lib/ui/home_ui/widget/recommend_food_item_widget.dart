import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_ui/cons/colors.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';
import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';

class RecommendItemFoodWidget extends StatelessWidget {
  final FoodEntity foodData;

  const RecommendItemFoodWidget({
    Key? key,
    required this.foodData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: Dimens.size5,
      ),
      child: SizedBox(
        width: 260,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 8,
              child: _buildFoodInfor(
                foodData.title,
                foodData.rate.toString(),
                foodData.meta?.cook.toString(),
              ),
            ),
            Positioned(
              right: Dimens.size8,
              child: _buildFoodImage(foodData.image ?? ""),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodInfor(String? name, String ratePoint, String? cookTime) {
    return Card(
      elevation: Dimens.size6,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.size10),
      ),
      child: Container(
        height: Dimens.size95,
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.size10,
          horizontal: Dimens.size10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _foodName(name ?? ""),
            _foodRate(ratePoint),
            _cookTime(cookTime ?? ""),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodImage(String imageUrl) {
    return Container(
      height: Dimens.size103,
      width: Dimens.size103,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CachedNetworkImage(
        memCacheWidth: Dimens.size103.toInt(),
        memCacheHeight: Dimens.size103.toInt(),
        imageUrl: imageUrl,
        fit: BoxFit.cover,
      )
      ,
    );
  }

  Widget _foodName(String name) {
    return SizedBox(
      width: Dimens.size140,
      height: Dimens.size23,
      child: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: Dimens.size14,
          color: AppColors.textColor,
        ),
      ),
    );
  }

  Widget _foodRate(String ratePoint) {
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

  Widget _cookTime(String cookTime) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.size5,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.timer_sharp,
            color: AppColors.subTitleColor,
            size: Dimens.size13,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimens.size5,
            ),
            child: Text(
              "$cookTime mins",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: Dimens.size13,
                color: AppColors.subTitleColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
