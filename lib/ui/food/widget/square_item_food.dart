import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_ui/cons/colors.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';
import 'package:flutter_food_recipe_ui/data/food/models/entity/food_entity.dart';

class SquareItemFood extends StatelessWidget {
  final int index;
  final FoodEntity data;
  final Function(int index, FoodEntity data)? onItemPressed;

  const SquareItemFood({
    Key? key,
    required this.index,
    required this.data,
    this.onItemPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(Dimens.size10),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(child: _buildImageCover()),
          Positioned.fill(child: _dimDecorator()),
          Positioned(
            top: Dimens.size10,
            right: Dimens.size10,
            child: _buildFoodRate(),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: _buildFoodInfo(),
          ),
          Positioned.fill(child: _touchDetector())
        ],
      ),
    );
  }

  Material _touchDetector() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap:() => onItemPressed?.call(index,data),
        child: Ink(),
      ),
    );
  }

  Widget _buildImageCover() => CachedNetworkImage(
        imageUrl: data.image ?? "",
        fit: BoxFit.cover,
      );

  Widget _buildFoodInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _titleFood(),
        const SizedBox(height: Dimens.size4),
        _subtitleTimeCook(),
      ],
    );
  }

  Widget _titleFood() => Text(
        data.title ?? "",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: Dimens.size16,
          fontWeight: FontWeight.bold,
          color: AppColors.backgroundColor,
        ),
      );

  Widget _subtitleTimeCook() => Text(
        "Time: ${data.meta?.cook?.toString() ?? ""}",
        maxLines: 1,
        style: const TextStyle(
          fontSize: Dimens.size14,
          color: AppColors.subTitleColor,
        ),
      );

  Widget _dimDecorator() => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black54,
            ],
          ),
        ),
      );

  Widget _buildFoodRate() {
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
            data.rate.toString(),
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
