import 'package:flutter/material.dart';

class AppColors{
  static const Color primary = Color(0xFF0097FF);
  static const Color secondary = Colors.white;
  static const Color blue = Color(0xFF1777F2);
  static const Color scaffold = Color(0xFFF0F2F5);
  static const Color textBlack = Colors.black;
  static const Color textGrey = Color(0xFF9da2a6);

  static const LinearGradient degradeHistory = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, Colors.black54]
  );

}