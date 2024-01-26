import 'package:flutter/material.dart';
import '../../styles/app_theme.dart';
import '../../styles/dimensions.dart';
import 'homeScreen.dart'; // Assuming homeScreen.dart is in the same directory

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? selectedRestaurant;
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
              value: selectedRestaurant,
              items: restaurantList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
                );
              }).toList(),
              onChanged: (String? newSelectedRestaurant) {
                setState(() {
                  selectedRestaurant = newSelectedRestaurant;
                });
              },
              hint: Text('Select a Restaurant', style: Theme.of(context).textTheme.bodyLarge),
            ),
            if (selectedRestaurant != null) ...[
            ],
            const SizedBox(height: Dimensions.padding),
            ElevatedButton(
              onPressed: () {
                // Implement logic to forward the selected restaurant
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.labelLarge?.color,
                backgroundColor: Theme.of(context).primaryColor,
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
