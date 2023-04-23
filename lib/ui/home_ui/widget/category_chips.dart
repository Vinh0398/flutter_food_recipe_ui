import 'dart:ffi';

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_ui/cons/colors.dart';
import 'package:flutter_food_recipe_ui/cons/dimens.dart';
import 'package:flutter_food_recipe_ui/data/category/models/entity/category_entity.dart';

class CategoryChip extends StatefulWidget {
  final List<CategoryEntity> listData;
  final Function(int, CategoryEntity?) onItemPressed;

  const CategoryChip({
    Key? key,
    required this.listData,
    required this.onItemPressed,
  }) : super(key: key);

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  int firstVal = 0;

  @override
  Widget build(BuildContext context) {
    return ChipsChoice<int?>.single(
      value: firstVal,
      onChanged: _onItemPressed,
      choiceItems: _buildChoiceItems(),
      choiceStyle: C2ChipStyle.filled(
        selectedStyle: C2ChipStyle(
          borderRadius: BorderRadius.circular(
            Dimens.size10,
          ),
          backgroundColor: AppColors.functionColor,
          foregroundColor: AppColors.backgroundColor,
        ),
        color: AppColors.backgroundColor,
        foregroundColor: AppColors.functionColor,
      ),
      runSpacing: 0,
      padding: EdgeInsets.zero,
    );
  }

  List<C2Choice<int?>> _buildChoiceItems() {
    final choiceItems = C2Choice.listFrom<int?, CategoryEntity>(
      source: widget.listData,
      value: (index, data) => index+1,
      label: (index, data) => data.name ?? "",
    );
    choiceItems.insert(0, const C2Choice(value: 0, label: 'All'));
    return choiceItems;
  }

  void _onItemPressed(int? value) {
    setState(() {
      firstVal = value ?? 0;
    });
    final index = value ?? 0;
    if (index == 0) {
      widget.onItemPressed(-1, null);
      return;
    }
    widget.onItemPressed(index, widget.listData[index]);
  }
}
