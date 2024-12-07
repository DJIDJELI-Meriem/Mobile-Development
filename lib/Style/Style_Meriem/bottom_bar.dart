import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;

  const CustomBottomNavigationBar({Key? key, required this.onTap}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(0.0),
        topRight: Radius.circular(0.0),
      ),
      child: Container(
        color: Colors.purple, // Replace with your AppColors.primary
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white, size: 30.0),
                onPressed: () => onTap(0),
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white, size: 30.0),
                onPressed: () => onTap(1),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: Colors.white, size: 30.0),
                onPressed: () => onTap(2),
              ),
              IconButton(
                icon: const Icon(Icons.manage_accounts, color: Colors.white, size: 30.0),
                onPressed: () => onTap(3),
              ),
              IconButton(
                icon: const Icon(Icons.person, color: Colors.white, size: 30.0),
                onPressed: () => onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
