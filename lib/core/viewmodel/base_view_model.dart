import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/filtrer_view_model.dart';
import 'package:flutter/material.dart';

class BaseMealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];

  FilterViewModel _filterViewModel;

  updateFilters(FilterViewModel filterViewModel) {
    _filterViewModel = filterViewModel;
  }

  List<MealModel> get meals {
    return _meals.where((meal) {
      print(1111);
      print(_filterViewModel.isGlutenFree);
      print(2222);
      print(meal.isGlutenFree);
      if (_filterViewModel.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterViewModel.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterViewModel.isVegan && !meal.isVegan) return false;
      if (_filterViewModel.isVegan && !meal.isVegan) return false;

      return true;
    }).toList();
  }

  set meals(List<MealModel> value) {
    _meals = value;
    notifyListeners();
  }

  List<MealModel> get originMeals {
    return _meals;
  }

}
