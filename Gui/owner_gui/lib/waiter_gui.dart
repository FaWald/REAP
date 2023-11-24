import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WaiterPage extends StatefulWidget {
  @override
  _WaiterPageState createState() => _WaiterPageState();
}

class _WaiterPageState extends State<WaiterPage> {
  String _selectedBill;
  List<String> _bills = []; // Diese Liste wird die Rechnungsdaten enthalten

  @override
  void initState() {
    super.initState();
    _fetchBills(); // Abrufen der Rechnungsdaten beim Start
  }

  Future<void> _fetchBills() async {
    try {
      var url = 'URL_ZU_IHRER_SERVERANWENDUNG'; // Setzen Sie hier die URL Ihrer Serveranwendung
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> billsFromServer = json.decode(response.body);
        setState(() {
          _bills = billsFromServer.map((bill) => bill.toString()).toList();
        });
      } else {
        // Fehlerbehandlung
        print('Serverfehler');
      }
    } catch (e) {
      // Fehlerbehandlung
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waiter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_bills.isNotEmpty) ...[
              DropdownButton<String>(
                value: _selectedBill,
                hint: Text('Wählen Sie eine Rechnung'),
                onChanged: (newValue) {
                  setState(() {
                    _selectedBill = newValue;
                  });
                },
                items: _bills.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ] else ...[
              CircularProgressIndicator(), // Ladeanzeige, während die Daten abgerufen werden
            ],
            // Weitere Widgets...
          ],
        ),
      ),
    );
  }
}
