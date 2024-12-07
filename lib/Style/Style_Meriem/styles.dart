// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// Define common colors
class AppColors {
  static const Color primary = Color.fromARGB(255, 39, 16, 91);
  static const Color secondary = Color.fromARGB(255, 99, 72, 162);
  static const Color buttonActive = Colors.yellow;
  static const Color buttonInactive = Color.fromARGB(255, 99, 72, 162);
  static const Color cardBackground = Colors.white;
  static const Color dialogBackground = Colors.white;
  static const Color error = Colors.red;
  static const Color success = Colors.green;
}

// Define common text styles
class AppTextStyles {
  static const TextStyle header = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle dialogTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle dialogButton = TextStyle(
    color: AppColors.primary,
  );

  static const TextStyle cardName = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle cardRole = TextStyle(
    fontSize: 14,
    color: Colors.black54,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 13,
    color: Colors.white,
  );
}

// Define button styles
class AppButtonStyles {
  static final ButtonStyle elevatedButton = ElevatedButton.styleFrom(
    elevation: 9,
    backgroundColor: AppColors.primary,
    textStyle: AppTextStyles.buttonText,
  );

  static ButtonStyle toggleButton(bool isActive) {
    return ElevatedButton.styleFrom(
      elevation: 9,
      backgroundColor: isActive ? AppColors.buttonActive : AppColors.buttonInactive,
    );
  }
}
