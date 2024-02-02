// Import statements for Flutter Material package and specific application pages and styles.
import 'package:flutter/material.dart';
import 'package:owner_gui/customer_gui/screens/homeScreen.dart'; // Import for the HomeScreen page.
import '../styles/app_theme.dart'; // Import for the custom application theme.

// The main function of the app, which initializes and runs the app.
void main() => runApp(const MyApp());

// MyApp class definition, which is a stateless widget.
// Stateless widgets are immutable, meaning that their properties can't change—all values are final.
class MyApp extends StatelessWidget {
  // Constructor for MyApp with an optional Key parameter.
  // Keys are used by Flutter to uniquely identify widgets.
  const MyApp({Key? key}) : super(key: key);

  // The build method describes the part of the user interface represented by the widget.
  // BuildContext parameter provides the context in which the build occurs.
  @override
  Widget build(BuildContext context) {
    // MaterialApp is the root widget for a Flutter app using Material Design.
    return MaterialApp(
      title: 'Restaurant App', // Title of the app, typically used by the system.
      theme: AppTheme.theme, // Application theme, defined in AppTheme.
      home: const HomeScreen(), // Specifies the HomeScreen as the default route of the app.
    );
  }
}
