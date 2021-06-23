import 'package:final_project/pages/HomePage.dart';
import 'package:final_project/pages/ViewResep.dart';
import 'package:final_project/pages/maps.dart';
import 'package:final_project/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  final User user;
  BottomNavBarWidget({this.user});
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  List<Widget> _listTab;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
//        navigateToScreens(index);
    });
  }

  void initState() {
    super.initState();
    _listTab = [HomePage(widget.user), Maps(), VResep(), ProfilePage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listTab[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.amberAccent,
            ),
            title: Text(
              "home",
              style: TextStyle(color: Colors.black),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.near_me,
              color: Colors.amberAccent,
            ),
            title: Text(
              "Offline Store",
              style: TextStyle(color: Colors.black),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.amberAccent,
            ),
            title: Text(
              "Favorit",
              style: TextStyle(color: Colors.black),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.amberAccent,
            ),
            title: Text(
              "Account",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
