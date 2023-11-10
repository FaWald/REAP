import 'package:flutter/material.dart';
import 'package:owner_gui/colors.dart';
import 'package:owner_gui/Product.dart';
import 'package:owner_gui/product_list.dart';


class OwnerPage extends StatefulWidget {
  @override
  _OwnerPageState createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  List<Product> _products = []; // Liste für die Produkte

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner Gui'),
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
              width: 200.0, // Breite des ersten Buttons
              height: 200.0, // Höhe des ersten Buttons
              child: FloatingActionButton(
                onPressed: () {
                  _showAddItemDialog(context);
                },
                child: Icon(Icons.add),
                backgroundColor: AppColors.buttonColor,
                heroTag: null,
              ),
            ),
            SizedBox(height: 16.0), // Vertikaler Abstand zwischen den Buttons
            SizedBox(
              width: 200.0, // Breite des zweiten Buttons
              height: 200.0, // Höhe des zweiten Buttons
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductListPage(products: _products)),
                  );
                },
                child: Icon(Icons.edit),
                backgroundColor: AppColors.buttonColor,
                heroTag: null,
              ),
            ),
          ],
        ),
      ),

    );
  }



  Widget _buildProductItem(Product product) {
    return Container(
      height: 80.0, // Höhe der Box
      margin: EdgeInsets.all(8.0), // Abstand zwischen den Boxen
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Rand um die Box
        borderRadius: BorderRadius.circular(8.0), // Abrundung der Ecken
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              '${product.price} €',
              style: TextStyle(fontSize: 18.0),
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
          title: Text('Neues Element hinzufügen'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Preis'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Abbrechen'),
            ),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                double price = double.parse(_priceController.text);
                Product product = Product(name, price);
                _products.add(product); // Produkt zur Liste hinzufügen
                print('Produkt hinzugefügt: Name: $name, Preis: $price');
                Navigator.of(context).pop();
              },
              child: Text('Bestätigen'),
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