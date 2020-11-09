import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/filer_view_model.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];

  FilterViewModel _filterViewModel;

  void updateFilters(FilterViewModel filterViewModel) {
    _filterViewModel = filterViewModel;
  }

  List<MealModel> get meals {
    return _meals.where((meal) {
      if (_filterViewModel.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterViewModel.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterViewModel.isVegetarian && !meal.isVegetarian) return false;
      if (_filterViewModel.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }


  List<MealModel> get originMeals {
      return _meals;
  }

  set meals(List<MealModel> value) {
    _meals = value;
    notifyListeners();
  }
}
