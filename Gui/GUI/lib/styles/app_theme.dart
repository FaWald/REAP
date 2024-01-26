// Import statements for Flutter's Material package and custom color definitions.
import 'package:flutter/material.dart';
import 'colors.dart'; // Custom colors defined in the 'colors.dart' file for use throughout the app.

// AppTheme class definition, used to configure the overall theme of the application.
class AppTheme {
  // A static getter `theme` that returns a ThemeData object.
  // This method is utilized to define a cohesive visual theme across the entire app.
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.buttonColor, // Setting the primary color of the app used in various widgets.
      scaffoldBackgroundColor: AppColors.backgroundColor, // Background color for Scaffold widgets.
      // Configuration for the theme of ElevatedButtons within the app.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.textColor, backgroundColor: AppColors.buttonColor, // Foreground and background colors for ElevatedButtons.
        ),
      ),
      // Configuration for the theme of TextButtons.
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textColor, // Text color for TextButtons.
        ),
      ),
      // Setting the text theme for different types of text used within the app.
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.textColor), // Style for large body text.
        bodyMedium: TextStyle(color: AppColors.textColor), // Style for medium-sized body text.
      ),
    );
  }
}
