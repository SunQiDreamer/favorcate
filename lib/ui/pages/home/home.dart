import 'package:favorcate/ui/pages/home/home_app_bar.dart';
import 'package:favorcate/ui/pages/home/home_content.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(context),
      body: HomeContent(),
    );
  }
}