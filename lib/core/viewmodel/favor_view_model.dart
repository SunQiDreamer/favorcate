import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/base_view_model.dart';

class FavorViewModel extends BaseViewModel {
  void addMeal(MealModel meal) {
    originMeals.add(meal);
    notifyListeners();
  }

  void removeMeals(MealModel meal) {
    originMeals.remove(meal);
    notifyListeners();
  }

  void handleMeal(MealModel meal) {
    if (isFavor(meal)) {
      removeMeals(meal);
    } else {
      addMeal(meal);
    }
  }

  bool isFavor(MealModel meal) {
    return originMeals.contains(meal);
  }
}
