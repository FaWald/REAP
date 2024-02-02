import 'package:flutter/material.dart';
import '../../styles/app_theme.dart';
import '../../styles/dimensions.dart';
import '../product.dart';
import 'productListScreen.dart'; // Assuming productListScreen.dart is in the same directory

class OwnerScreen extends StatefulWidget {
  const OwnerScreen({Key? key}) : super(key: key);

  @override
  _OwnerScreenState createState() => _OwnerScreenState();
}

class _OwnerScreenState extends State<OwnerScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final List<Product> _products = []; // List for products

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner Gui', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: AppTheme.theme.primaryColor,
      ),
      body: SizedBox(), // Empty container to ignore any message
      floatingActionButton: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Dimensions.buttonWidth,
              height: Dimensions.buttonHeight,
              child: FloatingActionButton(
                onPressed: () {
                  _showAddItemDialog(context);
                },
                backgroundColor: Theme.of(context).primaryColor,
                heroTag: 'addProduct',
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(height: Dimensions.spaceBetweenButtons),
            SizedBox(
              width: Dimensions.buttonWidth,
              height: Dimensions.buttonHeight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductListScreen(products: _products)),
                  );
                },
                backgroundColor: Theme.of(context).primaryColor,
                heroTag: 'editProduct',
                child: const Icon(Icons.edit),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Neues Element hinzufügen', style: Theme.of(context).textTheme.titleLarge),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: Dimensions.padding),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Preis'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Abbrechen', style: Theme.of(context).textTheme.bodyLarge),
            ),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                double price = double.tryParse(_priceController.text) ?? 0.0;
                if (name.isNotEmpty && price > 0) {
                  Product product = Product(name, price);
                  setState(() {
                    _products.add(product);
                  });
                }
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: Text('Bestätigen', style: Theme.of(context).textTheme.bodyLarge),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
