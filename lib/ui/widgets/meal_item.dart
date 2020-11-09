import 'dart:ui';

import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/widgets/operation_item.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';
import 'package:provider/provider.dart';

final cardRadius = 12.px;

class MealItem extends StatelessWidget {
  final MealModel _mealModel;

  MealItem(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius)),
        child: Column(
          children: [
            buildBasicInfo(context),
            buildOperationInfo()
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(DetailScreen.routeName, arguments: _mealModel);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(cardRadius),
              topRight: Radius.circular(cardRadius)),
          child: Image.network(
            _mealModel.imageUrl,
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(6.px)),
            child: Text(
              _mealModel.title,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(5.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OperationItem(Icon(Icons.schedule), "${_mealModel.duration}分钟"),
          OperationItem(Icon(Icons.restaurant), "${_mealModel.complexStr}"),
          buildFavorItem()],
      ),
    );
  }

  Widget buildFavorItem() {
    return Consumer<FavorViewModel>(
      builder: (ctx, favorViewModel, child) {
        final iconData = favorViewModel.isFavor(_mealModel) ? Icons.favorite: Icons.favorite_border;
        final favorColor = favorViewModel.isFavor(_mealModel) ? Colors.red : Colors.black;
        final title = favorViewModel.isFavor(_mealModel) ? "收藏" : "未收藏";

        return GestureDetector(
          child: OperationItem(Icon(iconData), title, textColor: favorColor),
          onTap: () {
            favorViewModel.handleMeal(_mealModel);
          },
        );
      },
    );
  }
}
