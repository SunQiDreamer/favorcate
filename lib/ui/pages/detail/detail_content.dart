import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';
import 'package:flutter/widgets.dart';

class DetailContent extends StatelessWidget {
  final MealModel _mealModel;

  DetailContent(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          buildBannerImage(),
          buildMakeTitle(context, "制作材料"),
          buildMakeMaterial(context),
          buildMakeTitle(context, "制作步骤"),
          buildMakeSteps(context)
        ],
      ),
    );
  }

  Widget buildBannerImage() {
    return Container(
      width: double.infinity,
      child: Image.network(_mealModel.imageUrl),
    );
  }

  Widget buildMakeMaterial(BuildContext context) {
    return buildMakeContent(
        context: context,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _mealModel.ingredients.length,
            itemBuilder: (ctx, index) {
              return Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(_mealModel.ingredients[index]),
                ),
              );
            }));
  }

  Widget buildMakeSteps(BuildContext context) {
    return buildMakeContent(
        context: context,
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: _mealModel.steps.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text("#${index + 1}"),
              ),
              title: Text(_mealModel.steps[index]),
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
        ));
  }

  Widget buildMakeTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline2
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildMakeContent({BuildContext context, Widget child}) {
    return Container(
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.px)),
      width: MediaQuery.of(context).size.width - 30.px,
      child: child,
    );
  }
}
