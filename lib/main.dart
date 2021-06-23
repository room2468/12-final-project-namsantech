import 'package:final_project/pages/LoginPage.dart';
import 'package:final_project/pages/ViewResep.dart';
import 'package:final_project/pages/maps.dart';
import 'package:final_project/widgets/BottomNavBarWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto', hintColor: Color(0xFFd0cece)),
      home: SignInPage(),
    );
  }
}
