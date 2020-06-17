import 'package:favorcate/ui/pages/home/home_content.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        leading: IconButton(
          icon: Icon(Icons.pan_tool),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: HomeContent(),
    );
  }
}
