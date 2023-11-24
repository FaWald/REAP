import 'package:flutter/material.dart';
import 'package:petars_test/Routes/PageRoutes.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

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
      initialRoute: PageRoutes.mainPage
      /*
      routes: {
        PageRoutes.routeInputPage: (context) => const InputPage(),
        PageRoutes.routeResultPage: (context) => const ResultPage(),
      },
      */
    );
  }
}