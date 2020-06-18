import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/services/http_request.dart';

class MealRequest {
  static Future<List<MealModel>> getMealData() async {
    final url = "/meal";
    final result = await HttpRequest.request(url);

    final mealArray = result["meal"];
    List<MealModel> meals = [];
    for (var json in mealArray) {
      meals.add(MealModel.fromJson(json));
    }
    return meals;
  }
}