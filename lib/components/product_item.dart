import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final int price;
  final int quantity;
  final bool isSelected;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onSelect;

  const ProductItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.isSelected,
    required this.onAdd,
    required this.onRemove,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: (bool? value) {
              onSelect();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.asset(
              imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevents overflow
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevents overflow
                ),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            // Added Flexible to prevent overflow
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: onRemove,
                  icon: const Icon(Icons.remove),
                  color: Colors.black,
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: onAdd,
                  icon: const Icon(Icons.add),
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
