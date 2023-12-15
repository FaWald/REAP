import 'package:flutter/material.dart';
import '../../styles/app_theme.dart';
import '../../styles/dimensions.dart';
import '../product.dart';
import 'productListScreen.dart'; // Assuming productListScreen.dart is in the same directory

class OwnerScreen extends StatefulWidget {
  const OwnerScreen({super.key});

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
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildProductItem(_products[index]);
        },
      ),
      floatingActionButton: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Dimensions.buttonWidth, // Use dimensions for button width
              height: Dimensions.buttonHeight, // Use dimensions for button height
              child: FloatingActionButton(
                onPressed: () {
                  _showAddItemDialog(context);
                },
                backgroundColor: Theme.of(context).primaryColor, // Use theme for button color
                heroTag: 'addProduct',
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(height: Dimensions.spaceBetweenButtons), // Use dimensions for space
            SizedBox(
              width: Dimensions.buttonWidth, // Use dimensions for button width
              height: Dimensions.buttonHeight, // Use dimensions for button height
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductListScreen(products: _products)),
                  );
                },
                backgroundColor: Theme.of(context).primaryColor, // Use theme for button color
                heroTag: 'editProduct',
                child: const Icon(Icons.edit),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(Product product) {
    return Container(
      height: Dimensions.productItemHeight, // Use dimensions for item height
      margin: const EdgeInsets.all(Dimensions.padding), // Use dimensions for margin
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor), // Use theme for border color
        borderRadius: BorderRadius.circular(Dimensions.cornerRadius), // Use dimensions for corner radius
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.name,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              '${product.price} €',
              style: Theme.of(context).textTheme.bodyLarge,
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
                if(name.isNotEmpty && price > 0) {
                  Product product = Product(name, price);
                  setState(() {
                    _products.add(product); // Add product to the list
                  });
                }
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor, // Use theme for button color
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
