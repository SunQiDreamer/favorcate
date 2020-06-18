import 'package:favorcate/core/services/meal_request.dart';
import 'package:favorcate/core/viewmodel/base_view_model.dart';

class MealViewModel extends BaseMealViewModel {
  MealViewModel() {
    MealRequest.getMealData().then((value) {
      this.meals = value;
    });
  }
}
