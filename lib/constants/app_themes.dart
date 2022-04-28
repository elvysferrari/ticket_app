import 'package:flutter/material.dart';

class AppColors{
  static const Color primary = Color(0xFF61affe);
  static const Color secondary = Colors.white;
  static const Color blue = Color(0xFF1777F2);
  static const Color scaffold = Color(0xFFF0F2F5);
  static const Color textBlack = Color(0xFF3b4151);
  static const Color textGrey = Color(0xFF7d8492);
  static const Color textDanger = Color(0xFFf93e3e);
  static const Color textSuccess = Color(0xFF49cc90);
  static const Color textWarning = Color(0xFFfca130);

  static const LinearGradient degradeHistory = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, Colors.black54]
  );

}