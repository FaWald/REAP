import 'package:flutter/material.dart';
import 'package:petars_test/Pages/MainPage.dart';
import 'package:petars_test/Pages/SignUpPage.dart';
import 'package:petars_test/Utils/RoutesManager.dart';

import 'Pages/LoginPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF111328),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF111328)
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: PageRoutes.loginPage,
      routes: {
        PageRoutes.loginPage: (context) => LoginPage(),
        PageRoutes.signupPage: (context) => SignupPage(),
        PageRoutes.mainPage: (context) => MainPage(),
      },
    );
  }
}