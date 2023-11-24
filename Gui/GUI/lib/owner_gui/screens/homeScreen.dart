import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../waiter_gui/waiter_gui.dart';
import 'ownerScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text('Owner Gui'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OwnerScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Text(
                  'Verwaltungssicht',
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
            SizedBox(height: 16), // Spacing between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WaiterPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Text(
                  'Beobachtungssicht',
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