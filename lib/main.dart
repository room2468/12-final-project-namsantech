import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:final_project/pages/LoginPage.dart';
import 'package:final_project/pages/ViewResep.dart';
import 'package:final_project/pages/maps.dart';
import 'package:final_project/pages/profile_page.dart';
import 'package:final_project/themes.dart';
import 'package:final_project/utils/user_preferences.dart';
import 'package:final_project/widgets/BottomNavBarWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.of(context),
          title: title,
          home: SignInPage(),
        ),
      ),
    );
  }
}
