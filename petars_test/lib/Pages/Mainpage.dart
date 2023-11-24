import 'package:flutter/material.dart';
import 'package:petars_test/Utils/ApiController.dart'; // Replace with the actual file name

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final apiController = ApiController(baseUrl: 'http://localhost:8080');
  late String responseData = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await apiController.sendGetRequest('/your-api-endpoint');
      setState(() {
        responseData = response.body;
      });
    } catch (error) {
      setState(() {
        responseData = 'Error: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Response Demo'),
      ),
      body: Center(
        child: Text(responseData),
      ),
    );
  }
}
