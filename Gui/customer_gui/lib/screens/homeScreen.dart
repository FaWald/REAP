import 'package:flutter/material.dart';
import '../order.dart';
import '../styles/dimensions.dart';
import '../styles/app_theme.dart';
import 'orderManagementScreen.dart';
import 'orderScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void _openOrderManagementScreen() {
    Order exampleOrder = Order([], 'Preparing'); // Replace with actual order data as needed
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderManagementScreen(order: exampleOrder)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
        backgroundColor: AppTheme.theme.primaryColor, // Using AppTheme for AppBar color
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderScreen()),
                  ).then((_) => setState(() {}));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(Dimensions.buttonWidth, Dimensions.buttonHeight),
                  textStyle: const TextStyle(fontSize: Dimensions.buttonFontSize),
                ),
                child: const Text('Reserve a Table'),
              ),
              const SizedBox(height: Dimensions.spaceBetweenButtons),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderManagementScreen(order: Order([], 'Preparing'))),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(Dimensions.buttonWidth, Dimensions.buttonHeight),
                  textStyle: const TextStyle(fontSize: Dimensions.buttonFontSize),
                ),
                child: const Text('Manage Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
