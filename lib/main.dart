import 'package:favorcate/core/router/router.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/core/viewmodel/filer_view_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/shared/size_fit.dart';
import 'ui/shared/app_theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => FilterViewModel()),
      ChangeNotifierProxyProvider<FilterViewModel, MealViewModel>(
        create: (ctx) => MealViewModel(),
        update: (ctx, filterViewModel, mealViewModel) {
          mealViewModel.updateFilters(filterViewModel);
          return mealViewModel;
        },
      ),
      ChangeNotifierProxyProvider<FilterViewModel, FavorViewModel>(
        create: (ctx) => FavorViewModel(),
        update: (ctx, filterVM, favorVM){
          favorVM.updateFilters(filterVM);
          return favorVM;
        }
      )
    ],
    child: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 对HYSizeFit进行初始化
    SizeFit.initialize();

    return MaterialApp(
      title: '美食广场',
      // 主题
      theme: AppTheme.norTheme,
      // 路由
      initialRoute: RouteManager.initialRoute,
      routes: RouteManager.routes,
      onGenerateRoute: RouteManager.generateRoute,
      onUnknownRoute: RouteManager.unknownRoute,
    );
  }
}

