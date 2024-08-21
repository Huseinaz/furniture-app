import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const Category({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 29, 97, 124)
              : Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : const Color.fromARGB(255, 29, 97, 124),
            ),
          ),
        ),
      ),
    );
  }
}
