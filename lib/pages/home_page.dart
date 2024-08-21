import 'package:flutter/material.dart';
import 'package:furniture/components/category.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _categories = [
      {
        'label': 'Chairs',
        'isSelected': selectedIndex == 0,
        'onTap': () => onCategorySelected(0),
      },
      {
        'label': 'Cupboards',
        'isSelected': selectedIndex == 1,
        'onTap': () => onCategorySelected(1),
      },
      {
        'label': 'Tables',
        'isSelected': selectedIndex == 2,
        'onTap': () => onCategorySelected(2),
      },
      {
        'label': 'Lamps',
        'isSelected': selectedIndex == 3,
        'onTap': () => onCategorySelected(3),
      },
      {
        'label': 'Beds',
        'isSelected': selectedIndex == 4,
        'onTap': () => onCategorySelected(4),
      },
      {
        'label': 'Sofas',
        'isSelected': selectedIndex == 5,
        'onTap': () => onCategorySelected(5),
      },
    ];

    return Scaffold(
      body: SafeArea(
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
                        isSelected: _categories[index]['isSelected'],
                        onTap: _categories[index]['onTap'],
                      ),
                    );
                  },
                ),
              ),
            ],
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
