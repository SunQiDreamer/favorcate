import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/services/json_parse.dart';
import 'package:favorcate/ui/pages/home/home_category_item.dart';
import 'package:flutter/material.dart';
//import 'package:favorcate/ui/shared/size_fit.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: JsonParse.getCategoryData(),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        if (snapshot.error != null) return Center(child: Text("请求失败"));

        final categories = snapshot.data;
        return GridView.builder(
            itemCount: categories.length,
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.5
            ), itemBuilder: (ctx, index) {
          return Container(child: homeCategoryItem(categories[index]));
        });
      },
    );
  }
}
