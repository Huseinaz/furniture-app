import 'package:flutter/material.dart';
import 'package:furniture/components/my_button.dart';
import 'package:furniture/components/cart_item.dart';
import 'package:furniture/components/product_card.dart';

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

  final List<Map<String, dynamic>> _products = [
    {
      'imagePath': 'assets/onboarding.jpg',
      'title': 'Modern Chair',
      'subtitle': 'Armchair',
      'price': 185,
      'isNew': true,
      'rating': 4.8,
      'onAddToCart': () {},
    },
    {
      'imagePath': 'assets/onboarding.jpg',
      'title': 'Minimalist Chair',
      'subtitle': 'Armchair',
      'price': 185,
      'isNew': true,
      'rating': 4.5,
      'onAddToCart': () {},
    },
    {
      'imagePath': 'assets/onboarding.jpg',
      'title': 'Yellow Chair',
      'subtitle': 'Armchair',
      'price': 185,
      'isNew': true,
      'rating': 4.3,
      'onAddToCart': () {},
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
        leadingWidth: 75,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ),
          ),
        ),
        title: const Text('Cart',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: const Icon(Icons.delete_outlined),
                onPressed: () {},
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ProductItem(
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
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recently View',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: SizedBox(
                height: 270,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ProductCard(
                        imagePath: _products[index]['imagePath'],
                        title: _products[index]['title'],
                        subtitle: _products[index]['subtitle'],
                        price: _products[index]['price'],
                        isNew: _products[index]['isNew'],
                        rating: _products[index]['rating'],
                        onAddToCart: _products[index]['onAddToCart'],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total (${_cartItems.where((item) => item['isSelected']).fold<double>(0, (total, item) => total + item['quantity']).toStringAsFixed(0)} items):',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '\$${_cartItems.where((item) => item['isSelected']).fold<double>(0, (total, item) => total + (item['quantity'] * item['price'])).toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: MyButton(
                onTap: () {},
                buttonText: 'Proceed to Checkout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
