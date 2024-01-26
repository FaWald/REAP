// Import statements for Flutter Material package and other required components and styles.
import 'package:flutter/material.dart';
import '../../styles/app_theme.dart'; // Custom application theme.
import '../../styles/dimensions.dart'; // Dimensions for UI elements.
import '../meal.dart'; // Meal class definition.
import 'orderManagementScreen.dart'; // Order management screen component.
import 'orderScreen.dart'; // Order screen component.

// Definition of the HomeScreen class which is a StatefulWidget.
// StatefulWidget is used when the UI can change dynamically.
class HomeScreen extends StatefulWidget {
  // Constructor for HomeScreen with an optional Key parameter.
  const HomeScreen({Key? key}) : super(key: key);

  // Creating the state for HomeScreen.
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Definition of the _HomeScreenState class which holds the state of HomeScreen.
class _HomeScreenState extends State<HomeScreen> {
  // The build method which describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    // Scaffold is used to implement the basic material design visual layout structure.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'), // Title of the AppBar.
        backgroundColor: AppTheme.theme.primaryColor, // Custom AppBar color from AppTheme.
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.padding), // Padding using predefined dimensions.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ElevatedButton for reserving a table.
              // Navigates to the OrderScreen when pressed.
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderScreen()),
                  ).then((_) => setState(() {})); // Refreshes the state upon returning to this screen.
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(Dimensions.buttonWidth, Dimensions.buttonHeight),
                  textStyle: const TextStyle(fontSize: Dimensions.buttonFontSize),
                ),
                child: const Text('Reserve a Table'),
              ),
              const SizedBox(height: Dimensions.spaceBetweenButtons), // Space between buttons.
              // ElevatedButton for managing orders.
              // Navigates to the OrderManagementScreen when pressed.
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
