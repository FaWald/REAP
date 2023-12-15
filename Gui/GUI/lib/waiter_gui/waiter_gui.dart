
import 'dart:convert';

import 'package:flutter/material.dart';
import '/utils/ApiController.dart';  // Assuming ApiController.dart is in the same directory

class WaiterPage extends StatefulWidget {
  @override
  _WaiterPageState createState() => _WaiterPageState();
}

class _WaiterPageState extends State<WaiterPage> {
  late ApiController apiController;
  List<dynamic> restaurants = [];

  @override
  void initState() {
    super.initState();
    apiController = ApiController(baseUrl: 'http://localhost:8080'); // Replace with your actual base URL
    fetchRestaurants();
  }

  Future<void> fetchRestaurants() async {
    try {
      var response = await apiController.sendGetRequest('/restaurants');
      if (response.statusCode == 200) {
        setState(() {
          restaurants = json.decode(response.body)['_embedded']['restaurants'];
        });
      } else {
        // Handle non-200 responses
        print('Failed to load restaurants');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waiter Page'),
      ),
      body: RefreshIndicator(
        onRefresh: fetchRestaurants,
        child: ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            var restaurant = restaurants[index];
            return ListTile(
              title: Text(restaurant['name']),
              subtitle: Text(restaurant['phoneNumber']),
              trailing: Text(restaurant['restaurantType']),
            );
          },
        ),
      ),
    );
  }
}
