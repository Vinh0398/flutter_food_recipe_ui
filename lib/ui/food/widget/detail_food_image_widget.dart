import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_ui/cons/colors.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';

class DetailFoodImageWidget extends StatelessWidget {
  final String imageUrl;
  final String footRatePoint;
  final String cookTime;

  const DetailFoodImageWidget({
    Key? key,
    required this.imageUrl,
    required this.footRatePoint,
    required this.cookTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.size230,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            Dimens.size10,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(child: _buildFoodImage()),
          Positioned(
            top: Dimens.size10,
            right: Dimens.size10,
            child: _buildFoodRate(),
          ),
          Positioned.fill(child: _buildDimDecorator()),
          Positioned(
            right: Dimens.size10,
            bottom: Dimens.size12,
            child: _buildCookTime(),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodImage() => CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
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
            footRatePoint,
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

  Widget _buildDimDecorator() => Container(
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

  Widget _buildCookTime() {
    return Row(
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
    );
  }
}
