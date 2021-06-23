import 'package:final_project/pages/HomePage.dart';
import 'package:final_project/pages/maps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    _listTab = [HomePage(widget.user), Maps()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: _listTab[_selectedIndex],
          )
        ],
      ),
    );

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Home',
            style: TextStyle(color: Color(0xFF2c2b2b)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.near_me),
          title: Text(
            'Store',
            style: TextStyle(color: Color(0xFF2c2b2b)),
          ),
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.card_giftcard),
        //   title: Text(
        //     'Favorite',
        //     style: TextStyle(color: Color(0xFF2c2b2b)),
        //   ),
        // ),
        // BottomNavigationBarItem(
        //   icon: Icon(FontAwesomeIcons.user),
        //   title: Text(
        //     'Account',
        //     style: TextStyle(color: Color(0xFF2c2b2b)),
        //   ),
        // ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFFfd5352),
      onTap: _onItemTapped,
    );
  }
}
