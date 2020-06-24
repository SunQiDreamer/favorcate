import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/base_view_model.dart';

class FavorViewModel extends BaseMealViewModel {
  addMeal(MealModel mealmodel) {
    originMeals.add(mealmodel);
    notifyListeners();
  }

  removeMeal(MealModel mealModel) {
    originMeals.remove(mealModel);
    notifyListeners();
  }

  handleMeal(MealModel mealModel) {
    if (isFavor(mealModel)) {
      removeMeal(mealModel);
    } else {
      addMeal(mealModel);
    }
  }

  bool isFavor(MealModel mealModel) {
    return originMeals.contains(mealModel);
  }
}
