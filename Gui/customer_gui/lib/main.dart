import 'package:flutter/material.dart';
import 'package:owner_gui/screens/homeScreen.dart';
import 'styles/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: AppTheme.theme, // Using the custom theme from AppTheme
      home: const HomeScreen(),
    );
  }
}
