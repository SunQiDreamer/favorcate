import 'dart:ui';

import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class MealItem extends StatelessWidget {
  final MealModel _mealModel;

  MealItem(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[buildBasicInfo(context), buildOperationInfo()],
        ),
      ),
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12)),
            child: Image.network(
              _mealModel.imageUrl,
              height: 250.px,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Positioned(
          left: 10,
          right: 10,
          bottom: 10,
          child: Container(
            decoration: BoxDecoration(color: Colors.black45),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: 300,
            child: Text(
              _mealModel.title,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  Widget buildOperationInfo() {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildOperationItem(Icon(Icons.schedule), "${_mealModel.duration}分钟"),
          buildOperationItem(Icon(Icons.restaurant), "${_mealModel.complexStr}"),
          buildFavorItem()
        ],
      ),
    );
  }

  Widget buildFavorItem() {
    return Container(
      child: Text('1111'),
    );
  }

  Widget buildOperationItem(Icon icon, String title) {
    return Row(
      children: [icon, SizedBox(width: 3,), Text(title)],
    );
  }
}
