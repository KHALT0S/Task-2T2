// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'home.dart';
import 'notifications.dart';
import 'search.dart';
import 'profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _MainPageState(),
    );
  }
}

class _MainPageState extends StatefulWidget {
  @override
  _MainPageStateState createState() => _MainPageStateState();
}

class _MainPageStateState extends State<_MainPageState> {
  final List<Widget> _pages = [Home(), Search(), Notifications(), Profile()];
  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        fixedColor: Colors.blueGrey,
        unselectedItemColor: Colors.blueGrey[200],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: "Profile"),
        ],
        onTap: _selectPage,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
