import 'package:flutter/material.dart';

class AccountOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color iconBackgroundColor;
  final VoidCallback? onTap;

  const AccountOption({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.iconBackgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            if (label != 'Log Out')
              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}
