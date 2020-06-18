import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';

class BaseMealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];

  List<MealModel> get meals => _meals;

  set meals(List<MealModel> value) {
    _meals = value;
    notifyListeners();
  }
}
