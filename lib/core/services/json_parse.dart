import 'package:favorcate/core/model/category_model.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class JsonParse {
  static Future<List<CategoryModel>> getCategoryData() async {
    final jsonString = await rootBundle.loadString("assets/json/category.json");
    final result = json.decode(jsonString);

    final resultList = result["category"];
    List<CategoryModel> categories = [];
    for (var json in resultList) {
      final model = CategoryModel.fromJson(json);
      categories.add(model);
    }
    return categories;
  }
}
