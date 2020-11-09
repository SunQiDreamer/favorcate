import 'package:favorcate/ui/pages/favor/favor.dart';
import 'package:favorcate/ui/pages/home/home.dart';
import 'package:favorcate/ui/pages/home/home_drawer.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "/";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(items: items,
      currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

final List<Widget> pages = [
  HomeScreen(),
  FavorScreen()
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    title: Text("首页"),
    icon: Icon(Icons.home)
  ),
  BottomNavigationBarItem(
      title: Text("收藏"),
      icon: Icon(Icons.star)
  ),
];