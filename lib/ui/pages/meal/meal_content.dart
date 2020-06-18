import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/ui/pages/meal/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class MealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Selector<MealViewModel, List<MealModel>>(
        selector: (ctx, mealVM) {
          return mealVM.meals.where((mealModel) {
            return mealModel.categories.contains(category.id);
          }).toList();
        },
        shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
        builder: (ctx, meals, child) {
          return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) {
                return MealItem(meals[index]);
              });
        });
  }
}
