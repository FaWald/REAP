// Import statements for Flutter Material package and other required components and styles.
import 'package:flutter/material.dart';
import '../../styles/app_theme.dart'; // Custom application theme.
import '../../styles/dimensions.dart'; // Dimensions for UI elements.
import '../meal.dart'; // Meal class definition.

// Definition of the OrderManagementScreen class which is a StatefulWidget.
// StatefulWidget is used for widgets that can change their state over time.
class OrderManagementScreen extends StatefulWidget {
  // The order object to be managed within this screen.
  final Order order;

  // Constructor for OrderManagementScreen with a required Order object and an optional Key.
  const OrderManagementScreen({Key? key, required this.order}) : super(key: key);

  // Creating the state for OrderManagementScreen.
  @override
  _OrderManagementScreenState createState() => _OrderManagementScreenState();
}

// Definition of the _OrderManagementScreenState class which holds the state of OrderManagementScreen.
class _OrderManagementScreenState extends State<OrderManagementScreen> {
  // The build method which describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    // Scaffold is used to implement the basic material design visual layout structure.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Management'), // Title of the AppBar.
        backgroundColor: AppTheme.theme.primaryColor, // Custom AppBar color from AppTheme.
      ),
      // Padding provides space around the child of the Scaffold.
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.padding), // Padding using predefined dimensions.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Your order status:'),
            const SizedBox(height: Dimensions.spaceBetweenButtons), // Spacer for visual separation.
            // Displays the current status of the order.
            Text(
              widget.order.status,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: Dimensions.spaceBetweenButtons), // Spacer for visual separation.
            const Text('Do you want to cancel this order?'),
            const SizedBox(height: Dimensions.spaceBetweenButtons), // Spacer for visual separation.
            // ElevatedButton to cancel the order.
            // Updates the order status to "Cancelled".
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.order.status = "Cancelled";
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(Dimensions.buttonWidth, Dimensions.buttonHeight),
                textStyle: const TextStyle(fontSize: Dimensions.buttonFontSize),
              ),
              child: const Text('Yes, Cancel'),
            ),
            const SizedBox(height: Dimensions.spaceBetweenButtons), // Spacer for visual separation.
            // ElevatedButton to go back without cancelling the order.
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Returns to the previous screen.
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(Dimensions.buttonWidth, Dimensions.buttonHeight),
                textStyle: const TextStyle(fontSize: Dimensions.buttonFontSize),
              ),
              child: const Text('No, Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
