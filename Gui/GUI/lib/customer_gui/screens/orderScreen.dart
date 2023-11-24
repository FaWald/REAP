import 'package:flutter/material.dart';
import '../../styles/app_theme.dart';
import '../../styles/dimensions.dart';
import '../meal.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController _seatController = TextEditingController();
  TimeOfDay? selectedTime;
  List<Meal> selectedMeals = [];

  @override
  void dispose() {
    _seatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Reserve a Table & Order Meal'),
          backgroundColor: AppTheme.theme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.padding),
        child: ListView(
          children: [
            SizedBox(
              height: Dimensions.textFormFieldHeight,
              child: TextField(
                controller: _seatController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Number of Seats',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    selectedTime = time;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(Dimensions.buttonWidth, Dimensions.buttonHeight),
              ),
              child: Text(selectedTime == null ? 'Select Time' : selectedTime!.format(context)),
            ),
            const SizedBox(height: Dimensions.spaceBetweenButtons),
            const Text("Select Meals:"),
            ...menu.map((meal) => CheckboxListTile(
              title: Text('${meal.name} (\$${meal.price.toStringAsFixed(2)})'),
              value: selectedMeals.contains(meal),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedMeals.add(meal);
                  } else {
                    selectedMeals.remove(meal);
                  }
                });
              },
            )).toList(),
            ElevatedButton(
              onPressed: () {
                // Implement functionality to confirm reservation and order
                Navigator.pop(context); // Go back to HomeScreen after confirming reservation and order
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(Dimensions.buttonWidth, Dimensions.buttonHeight),
              ),
              child: const Text('Reserve & Order'),
            )
          ],
        ),
      ),
    );
  }
}
