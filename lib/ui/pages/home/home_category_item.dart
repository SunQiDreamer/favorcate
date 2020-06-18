import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class HomeCategoryItem extends StatelessWidget {
  final CategoryModel _categoryModel;

  HomeCategoryItem(this._categoryModel);

  @override
  Widget build(BuildContext context) {
    final bgColor = _categoryModel.cColor;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(MealScreen.routerName, arguments: _categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: _categoryModel.cColor,
          borderRadius: BorderRadius.circular(12.px),
          gradient: LinearGradient(
            colors: [
              bgColor.withOpacity(.5),
              bgColor
            ]
          )
        ),
        alignment: Alignment.center,
        child: Text(_categoryModel.title, style: Theme.of(context).textTheme.headline3.copyWith(
          fontWeight: FontWeight.bold
        )),
      ),
    );
  }
}
