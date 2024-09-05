import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle titleStyle(
      {Color color = Colors.white, double fontSize = 18}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.bold,
      height: 1.5,
      letterSpacing: 1.2,
    );
  }

  static TextStyle normalStyle(
      {Color color = Colors.black87, double fontSize = 16}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: color,
      height: 1.5,
    );
  }
}
