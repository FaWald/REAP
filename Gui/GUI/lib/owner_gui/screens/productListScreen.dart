import 'package:flutter/material.dart';
import '../../styles/app_theme.dart';
import '../../styles/dimensions.dart';
import '../Product.dart';

class ProductListScreen extends StatefulWidget {
  final List<Product> products;

  const ProductListScreen({super.key, required this.products});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: AppTheme.theme.primaryColor,
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
        _deleteProduct(index);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: Dimensions.padding), // This color should come from the theme if possible
        child: const Icon(
          Icons.delete,
          color: Colors.white, // This color should come from the theme if possible
          size: 36.0,
        ),
      ),
      child: ListTile(
        title: Text(product.name, style: Theme.of(context).textTheme.bodyLarge),
        subtitle: Text('${product.price} €', style: Theme.of(context).textTheme.bodyMedium),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            _deleteProduct(index);
          },
        ),
      ),
    );
  }

  void _deleteProduct(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Produkt löschen', style: Theme.of(context).textTheme.titleLarge),
          content: Text('Möchten Sie das Produkt wirklich löschen?', style: Theme.of(context).textTheme.bodyMedium),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog window
              },
              child: Text('Abbrechen', style: Theme.of(context).textTheme.bodyLarge),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.products.removeAt(index); // Remove the product from the list
                });
                Navigator.of(context).pop(); // Close the dialog window
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error, // Use error color from theme for delete button
              ),
              child: Text('Löschen', style: Theme.of(context).textTheme.bodyLarge),
            ),
          ],
        );
      },
    );
  }
}
