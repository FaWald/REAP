import 'package:flutter/material.dart';
import '../../styles/app_theme.dart';
import '../../styles/dimensions.dart';
import 'homeScreen.dart'; // Assuming homeScreen.dart is in the same directory

class LoginScreen extends StatelessWidget {
  final List<String> restaurantList = ['Restaurant 1', 'Restaurant 2', 'Restaurant 3']; // Add restaurant names here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: AppTheme.theme.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              items: restaurantList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
                );
              }).toList(),
              onChanged: (String? selectedRestaurant) {
                // Implement logic to save selected restaurant
              },
              hint: Text('Select a Restaurant', style: Theme.of(context).textTheme.bodyLarge),
            ),
            const SizedBox(height: Dimensions.padding), // Use dimensions for spacing
            ElevatedButton(
              onPressed: () {
                // Implement logic to forward the selected restaurant
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.labelLarge?.color, backgroundColor: Theme.of(context).primaryColor, // Use theme for text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.padding),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(Dimensions.padding),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: Dimensions.buttonFontSize),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
