import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String title;
  String color;
  Color cColor;

  CategoryModel({this.id, this.title, this.cColor});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    color = json["color"];

    final colorInt = int.parse(color, radix: 16);
    cColor = Color(colorInt | 0xFF000000);
  }
}
