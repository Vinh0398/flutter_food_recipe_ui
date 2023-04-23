import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_ui/cons/colors.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';
import 'package:flutter_food_recipe_ui/gen/assets.gen.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.size16,
        right: Dimens.size16,
        left: Dimens.size16,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitle(),
          _buildAvatar(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Hello User',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Dimens.size25,
            color: AppColors.titleColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Dimens.size5,
          ),
          child: Text(
            'What are you cooking today?',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: Dimens.size16,
              color: AppColors.subTitleColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: Dimens.size40,
      height: Dimens.size40,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.size10),
      ),
      child: Image.asset(
        Assets.image.avatar.path,
        fit: BoxFit.cover,
      ),
    );
  }
}
