import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'page_1.dart';
import 'page_2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          Page1(),
          Page2(),
          Container(color: Colors.green),
          Container(color: Colors.yellow),
        ],
      ),
      bottomNavigationBar: GNav(
        haptic: true,
        backgroundColor: Colors.cyan,
        tabBackgroundColor: Colors.white,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        gap: 7,
        padding: EdgeInsets.all(15),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(icon: Icons.favorite, text: 'Favourite'),
          GButton(icon: Icons.settings, text: 'Settings'),
          GButton(icon: Icons.search, text: 'Search')
        ],
      ),
    );
  }
}
