import 'package:flutter/material.dart';
import 'package:furniture/components/best_seller_item.dart';
import 'package:furniture/components/category.dart';
import 'package:furniture/components/product_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {
      'label': 'Chairs',
      'isSelected': false,
      'onTap': () {},
    },
    {
      'label': 'Cupboards',
      'isSelected': false,
      'onTap': () {},
    },
    {
      'label': 'Tables',
      'isSelected': false,
      'onTap': () {},
    },
    {
      'label': 'Lamps',
      'isSelected': false,
      'onTap': () {},
    },
    {
      'label': 'Beds',
      'isSelected': false,
      'onTap': () {},
    },
    {
      'label': 'Sofas',
      'isSelected': false,
      'onTap': () {},
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

  final List<Map<String, dynamic>> _bestSellerItems = [
    {
      'imagePath': 'assets/onboarding.jpg',
      'title': 'Modern Chair',
      'description': 'Armchair High',
      'price': 185,
      'onAddToCart': () {},
    },
    {
      'imagePath': 'assets/onboarding.jpg',
      'title': 'Minimalist Chair',
      'description': 'Armchair High',
      'price': 175,
      'onAddToCart': () {},
    },
    {
      'imagePath': 'assets/onboarding.jpg',
      'title': 'Yellow Chair',
      'description': 'Armchair High',
      'price': 185,
      'onAddToCart': () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discover the Best\nFurniture',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey[600]),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search for furniture',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                          ),
                        ),
                      ),
                      Icon(Icons.filter_list_rounded, color: Colors.grey[600]),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Category(
                          label: _categories[index]['label'],
                          isSelected: selectedIndex == index,
                          onTap: () => onCategorySelected(index),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
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
                const SizedBox(height: 15),
                Text(
                  'Best Seller',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _bestSellerItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: BestSellerItem(
                          imagePath: _bestSellerItems[index]['imagePath'],
                          title: _bestSellerItems[index]['title'],
                          description: _bestSellerItems[index]['description'],
                          price: _bestSellerItems[index]['price'],
                          onAddToCart: _bestSellerItems[index]['onAddToCart'],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCategorySelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
