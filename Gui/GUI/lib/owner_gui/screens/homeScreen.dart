import 'package:flutter/material.dart';
import '../../styles/app_theme.dart';
import '../../styles/dimensions.dart';
import '../../waiter_gui/waiter_gui.dart';
import 'ownerScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner Gui', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: AppTheme.theme.primaryColor,
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
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.labelLarge?.color, backgroundColor: Theme.of(context).primaryColor, // Use theme for text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.cornerRadius), // Use dimensions for corner radius
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.padding),
                child: Text(
                  'Verwaltungssicht',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: Dimensions.buttonFontSize),
                ),
              ),
            ),
            const SizedBox(height: Dimensions.spaceBetweenButtons), // Use dimensions for space
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WaiterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.labelLarge?.color, backgroundColor: Theme.of(context).primaryColor, // Use theme for text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.cornerRadius), // Use dimensions for corner radius
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.padding),
                child: Text(
                  'Beobachtungssicht',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: Dimensions.buttonFontSize),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
