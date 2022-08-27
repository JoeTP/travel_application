import 'package:flutter/material.dart';

import 'nav_pages/bar_page.dart';
import 'nav_pages/home_page.dart';
import 'nav_pages/profile_page.dart';
import 'nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarPage(),
    SearchPage(),
    ProfilePage(),
  ];

  List <BottomNavigationBarItem> items = [
    BottomNavigationBarItem(label: 'Home',icon: Icon(Icons.crop_free_rounded)),
    BottomNavigationBarItem(label: 'Bar',icon: Icon(Icons.bar_chart_sharp)),
    BottomNavigationBarItem(label: 'Search',icon: Icon(Icons.search)),
    BottomNavigationBarItem(label: 'Me',icon: Icon(Icons.person)),
  ];

  int currentIndex = 0;
  void onTap(int index){
    setState((){
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: items,
        currentIndex: currentIndex,
        elevation: 0,

        type: BottomNavigationBarType.fixed,
        onTap: onTap
      )
    );
  }
}
