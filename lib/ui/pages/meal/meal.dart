import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/meal/meal_content.dart';
import 'package:flutter/material.dart';

class MealScreen extends StatelessWidget {
  static final String routerName = "/meal";

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: MealContent(),
    );
  }
}
