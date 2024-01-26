import 'dart:convert'; // Importing Dart's built-in JSON handling capabilities.

import 'package:flutter/material.dart';
import '/utils/ApiController.dart';  // Importing the ApiController class, assuming it's in the same directory.

// Definition of the WaiterPage class, a StatefulWidget.
// This class represents a page in the app dedicated to waiter-related functionalities.
class WaiterPage extends StatefulWidget {
  @override
  _WaiterPageState createState() => _WaiterPageState(); // Creating the state for WaiterPage.
}

// Private State class for WaiterPage.
class _WaiterPageState extends State<WaiterPage> {
  late ApiController apiController; // Instance of ApiController for making API calls.
  List<dynamic> restaurants = []; // List to hold restaurant data fetched from the API.

  @override
  void initState() {
    super.initState();
    apiController = ApiController(baseUrl: 'http://localhost:8080'); // Initializing ApiController with the base URL.
    fetchRestaurants(); // Fetching restaurant data on initialization.
  }

  // Async method to fetch restaurant data from an API endpoint.
  Future<void> fetchRestaurants() async {
    try {
      var response = await apiController.sendGetRequest('/restaurants');
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON.
        setState(() {
          restaurants = json.decode(response.body)['_embedded']['restaurants'];
        });
      } else {
        // Handling non-200 responses here.
        print('Failed to load restaurants');
      }
    } catch (e) {
      // Handling exceptions in the API call.
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Building the UI of the WaiterPage.
    return Scaffold(
      appBar: AppBar(
        title: Text('Waiter Page'), // Title of the AppBar.
      ),
      body: RefreshIndicator(
        onRefresh: fetchRestaurants, // Pull-to-refresh to re-fetch restaurant data.
        child: ListView.builder(
          itemCount: restaurants.length, // Number of items in the list.
          itemBuilder: (context, index) {
            var restaurant = restaurants[index]; // Restaurant data for the current list item.
            return ListTile(
              title: Text(restaurant['name']), // Displaying the name of the restaurant.
              subtitle: Text(restaurant['phoneNumber']), // Displaying the phone number.
              trailing: Text(restaurant['restaurantType']), // Displaying the type of the restaurant.
            );
          },
        ),
      ),
    );
  }
}
