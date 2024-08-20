import 'package:flutter/material.dart';
import 'package:furniture/components/my_button.dart';
import 'package:furniture/components/product_item.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'imagePath': 'assets/onboarding.jpg',
      'title': 'Modern Chair',
      'description': 'Armchair High',
      'price': 185,
      'quantity': 1,
      'isSelected': false,
    },
    {
      'imagePath': 'assets/onboarding.jpg',
      'title': 'Minimalist Chair',
      'description': 'Armchair High',
      'price': 175,
      'quantity': 1,
      'isSelected': false,
    },
    {
      'imagePath': 'assets/onboarding.jpg',
      'title': 'Yellow Chair',
      'description': 'Armchair High',
      'price': 185,
      'quantity': 1,
      'isSelected': false,
    },
  ];

  void _addQuantity(int index) {
    setState(() {
      _cartItems[index]['quantity']++;
    });
  }

  void _removeQuantity(int index) {
    setState(() {
      if (_cartItems[index]['quantity'] > 1) _cartItems[index]['quantity']--;
    });
  }

  void _toggleSelection(int index) {
    setState(() {
      _cartItems[index]['isSelected'] = !_cartItems[index]['isSelected'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          final item = _cartItems[index];
          return Column(
            children: [
              ProductItem(
                imagePath: item['imagePath'],
                title: item['title'],
                description: item['description'],
                price: item['price'],
                quantity: item['quantity'],
                isSelected: item['isSelected'],
                onAdd: () => _addQuantity(index),
                onRemove: () => _removeQuantity(index),
                onSelect: () => _toggleSelection(index),
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total (${_cartItems.length} items):',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '\$${_cartItems.where((item) => item['isSelected']).fold<double>(0, (total, item) => total + (item['quantity'] * item['price']))}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          MyButton(
            onTap: () {},
            buttonText: 'Proceed to Checkout',
          ),
        ],
      ),
    );
  }
}
