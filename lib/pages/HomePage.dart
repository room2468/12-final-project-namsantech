import 'package:flutter/material.dart';
import 'package:final_project/pages/SignInPage.dart';
import 'package:final_project/widgets/PopularFoodsWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        title: Text(
          "What would you like to eat?",
          style: TextStyle(
              color: Color(0xFF3a3737),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Color(0xFF3a3737),
              ),    
          )
          ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PopularFoodsWidget(),
          ],
        ),
      ),
    );
  }
}