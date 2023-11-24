import 'package:flutter/material.dart';

import '../product.dart';

class ProductListScreen extends StatefulWidget {
  final List<Product> products;

  ProductListScreen({required this.products});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildProductItem(widget.products[index], index);
        },
      ),
    );
  }

  Widget _buildProductItem(Product product, int index) {
    return Dismissible(
      key: Key(product.name),
      onDismissed: (direction) {
        // Handle dismiss (delete) here
        _deleteProduct(context, index);
      },
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 36.0,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 16.0),
      ),
      child: ListTile(
        title: Text(product.name),
        subtitle: Text('${product.price} €'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Handle delete here
            _deleteProduct(context, index);
          },
        ),
      ),
    );
  }

  void _deleteProduct(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Produkt löschen'),
          content: Text('Möchten Sie das Produkt wirklich löschen?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Schließe das Dialogfenster
              },
              child: Text('Abbrechen'),
            ),
            ElevatedButton(
              onPressed: () {
                // Lösche das Produkt aus der Liste
                setState(() {
                  widget.products.removeAt(index);
                });
                Navigator.of(context).pop(); // Schließe das Dialogfenster
              },
              child: Text('Löschen'),
            ),
          ],
        );
      },
    );
  }
}
