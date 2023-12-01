import 'package:flutter/material.dart';
import 'LoginPage.dart';

class SignupPage extends StatelessWidget {
  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your signup form elements here

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
