import 'package:flutter/material.dart';
import '../../styles/app_theme.dart';
import '../../styles/dimensions.dart';
import '../meal.dart';

class OrderManagementScreen extends StatefulWidget {
  final Order order;

  const OrderManagementScreen({Key? key, required this.order}) : super(key: key);

  @override
  _OrderManagementScreenState createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends State<OrderManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Order Management'),
          backgroundColor: AppTheme.theme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Your order status:'),
            const SizedBox(height: Dimensions.spaceBetweenButtons),
            Text(
              widget.order.status,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: Dimensions.spaceBetweenButtons),
            const Text('Do you want to cancel this order?'),
            const SizedBox(height: Dimensions.spaceBetweenButtons),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.order.status = "Cancelled";
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(Dimensions.buttonWidth, Dimensions.buttonHeight),
                textStyle: const TextStyle(fontSize: Dimensions.buttonFontSize),
              ),
              child: const Text('Yes, Cancel'),
            ),
            const SizedBox(height: Dimensions.spaceBetweenButtons),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(Dimensions.buttonWidth, Dimensions.buttonHeight),
                textStyle: const TextStyle(fontSize: Dimensions.buttonFontSize),
              ),
              child: const Text('No, Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
