import 'package:favorcate/core/router/router.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/ui/shared/app_theme.dart';
import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => MealViewModel())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SizeFit.initialize();

    return MaterialApp(
      title: "美食广场",
      theme: AppTheme.norTheme,
      initialRoute: Router.initialRoute,
      routes: Router.routes,
      onUnknownRoute: Router.onUnknownRoute,
      onGenerateRoute: Router.onGenerateRoute,
    );
  }
}
