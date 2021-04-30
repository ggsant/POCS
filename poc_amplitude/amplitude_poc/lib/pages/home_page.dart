import 'package:amplitude_poc/pages/settings_page.dart';
import 'package:amplitude_poc/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

import 'sign_in_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    SignInPage(),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
    SettingsPage(),
  ];
  PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Amplitude')),
      body: PageView(
        controller: _pageController,
        children: pages,
      ),
      bottomNavigationBar: NavBar(
        onPressed: _changePage,
        selectedIndex: _selectedIndex,
        items: [
          NavBarItem(iconData: Icons.add),
          NavBarItem(iconData: Icons.grid_on),
          NavBarItem(iconData: Icons.timer),
          NavBarItem(iconData: Icons.settings),
        ],
      ),
    );
  }
}
