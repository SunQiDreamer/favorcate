import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:favorcate/ui/pages/main/main.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static final String initialRoute = MainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainScreen.routeName: (ctx) => MainScreen(),
    MealScreen.routeName: (ctx) => MealScreen(),
    DetailScreen.routeName: (ctx) => DetailScreen(),
    FilterScreen.routeName: (ctx) => FilterScreen()
  };

  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}