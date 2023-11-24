import 'package:flutter/material.dart';
import 'colors.dart';
import 'restaurant_gui_home.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  final List<String> restaurantList = ['Restaurant 1', 'Restaurant 2', 'Restaurant 3']; // Hier kannst du die Namen der Restaurants hinzufügen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              items: restaurantList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? selectedRestaurant) {
                // Hier kannst du die Logik implementieren, um das ausgewählte Restaurant zu speichern
              },
              hint: Text('Wähle ein Restaurant aus'),
            ),
            SizedBox(height: 16), // Spacing between dropdown and button
            ElevatedButton(
              onPressed: () {
                // Hier solltest du die Logik implementieren, um das ausgewählte Restaurant weiterzuleiten
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestaurantGUIHome()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Weiter',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppColors.buttonColor, // Background color
                onPrimary: AppColors.textColor, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
