import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:owner_gui/customer_gui/screens/homeScreen.dart';
import 'package:owner_gui/pojos/Restaurant.dart';
import 'package:owner_gui/utils/ApiController.dart';
import '../styles/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void exampleAPIController() {
    ApiController controller = ApiController(baseUrl: "http://localhost:8080");
    List<Restaurant> restaurants = Restaurant.fromJsonList((controller.sendGetRequest("/restaurants") as Response).body);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: AppTheme.theme, // Using the custom theme from AppTheme
      home: const HomeScreen(),
    );
  }
}
