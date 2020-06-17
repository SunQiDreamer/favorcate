import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/pages/main/main.dart';
import 'package:flutter/material.dart';

class Router {
  static final String initialRoute = MainScreen.routerName;

  static final Map<String, WidgetBuilder> routes = {
    MainScreen.routerName: (ctx) => MainScreen(),
    DetailScreen.routerName: (ctx) => DetailScreen()
  };

  static final RouteFactory onGenerateRoute = (setting) {
    return null;
  };

  static final RouteFactory onUnknownRoute = (setting) {
    return null;
  };
}
