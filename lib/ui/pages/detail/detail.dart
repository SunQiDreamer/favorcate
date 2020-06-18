import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/detail/detail_content.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  static final routerName = "/detail";

  @override
  Widget build(BuildContext context) {

    final model = ModalRoute.of(context).settings.arguments as CategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: DetailContent()
    );
  }
}
