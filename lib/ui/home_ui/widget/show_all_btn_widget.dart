import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_ui/cons/colors.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';

class ShowAllBtnWidget extends StatelessWidget {
  final Function()? onPress;

  const ShowAllBtnWidget({
    Key? key,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: const Text(
        'Show All',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: Dimens.size11,
          color: AppColors.functionColor,
        ),
      ),
    );
  }
}
