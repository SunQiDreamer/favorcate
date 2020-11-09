import 'package:favorcate/core/services/meal_request.dart';
import 'package:favorcate/core/viewmodel/base_view_model.dart';

class MealViewModel extends BaseViewModel {
  MealViewModel() {
    MealRequest.getMealData().then((res) => meals = res);
  }
}