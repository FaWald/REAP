// Import statements for Flutter Material package and other required components and styles.
import 'package:flutter/material.dart';
import '../../styles/app_theme.dart'; // Custom application theme.
import '../../styles/dimensions.dart'; // Dimensions for UI elements.
import '../meal.dart'; // Meal class definition.

// Definition of the OrderScreen class which is a StatefulWidget.
// StatefulWidget is used for widgets that can dynamically change their state.
class OrderScreen extends StatefulWidget {
  // Constructor for OrderScreen with an optional Key parameter.
  const OrderScreen({Key? key}) : super(key: key);

  // Creating the state for OrderScreen.
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

// Definition of the _OrderScreenState class which holds the state of OrderScreen.
class _OrderScreenState extends State<OrderScreen> {
  // Text editing controller for managing the input of the number of seats.
  final TextEditingController _seatController = TextEditingController();
  // Variable to store the selected time of reservation.
  TimeOfDay? selectedTime;
  // List to keep track of the selected meals.
  List<Meal> selectedMeals = [];

  // Override the dispose method to clean up the controller when the widget is disposed.
  @override
  void dispose() {
    _seatController.dispose(); // Disposing the controller to prevent memory leaks.
    super.dispose();
  }

  // The build method which describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    // Scaffold is used to implement the basic material design visual layout structure.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserve a Table & Order Meal'), // Title of the AppBar.
        backgroundColor: AppTheme.theme.primaryColor, // Custom AppBar color from AppTheme.
      ),
      // Padding provides space around the child of the Scaffold.
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.padding), // Padding using predefined dimensions.
        child: ListView(
          children: [
            // TextField for inputting the number of seats for reservation.
            SizedBox(
              height: Dimensions.textFormFieldHeight,
              child: TextField(
                controller: _seatController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Number of Seats',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // ElevatedButton to pick the time for reservation.
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    selectedTime = time;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(Dimensions.buttonWidth, Dimensions.buttonHeight),
              ),
              child: Text(selectedTime == null ? 'Select Time' : selectedTime!.format(context)),
            ),
            const SizedBox(height: Dimensions.spaceBetweenButtons),
            const Text("Select Meals:"),
            // Dynamic list of CheckboxListTiles for each meal in the menu.
            ...menu.map((meal) => CheckboxListTile(
              title: Text('${meal.name} (\$${meal.price.toStringAsFixed(2)})'),
              value: selectedMeals.contains(meal),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedMeals.add(meal);
                  } else {
                    selectedMeals.remove(meal);
                  }
                });
              },
            )).toList(),
            // ElevatedButton to confirm the reservation and order.
            ElevatedButton(
              onPressed: () {
                // Implement functionality to confirm reservation and order.
                Navigator.pop(context); // Go back to HomeScreen after confirming reservation and order.
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(Dimensions.buttonWidth, Dimensions.buttonHeight),
              ),
              child: const Text('Reserve & Order'),
            )
          ],
        ),
      ),
    );
  }
}
