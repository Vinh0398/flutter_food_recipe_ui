import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_ui/cons/colors.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';

class FoodDescriptionWidget extends StatelessWidget {
  final String descriptionText;

  const FoodDescriptionWidget({Key? key, required this.descriptionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFoodDescriptionTitle(title: 'Food Information'),
        _buildFoodDescription(),
      ],
    );
  }

  Widget _buildFoodDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimens.size16,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.size16, horizontal: Dimens.size16),
        decoration: const BoxDecoration(
            color: AppColors.recommendFoodBackgroundTextColor,
            borderRadius: BorderRadius.all(Radius.circular(Dimens.size10))),
        child: Text(
          descriptionText,
          softWrap: true,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: AppColors.subTitleColor,
          ),
        ),
      ),
    );
  }

  Widget _buildFoodDescriptionTitle({required String title}){
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.size12),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: Dimens.size20,
          color: AppColors.textColor,
        ),
      ),
    );
  }
}
