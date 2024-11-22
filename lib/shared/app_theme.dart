import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF39A552);
  static const Color black = Color(0xFF303030);
  static const Color nevy = Color(0xFF4f5A69);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF79828B);
  static const Color blue = Color(0xFF003E90);
  static const Color move = Color(0xFFED1E79);
  static const Color babyblue = Color(0xFF4882CF);
  static const Color yellew = Color(0xFFF2D352);
  static const Color broown = Color(0xFFCF7E48);
  static const Color red = Color(0xFFC91C22);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      foregroundColor: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: primary,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: white,
      ),
    ),
    textTheme: const TextTheme(
        titleLarge:
            TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: white),
        titleSmall:
            TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: black)),
  );
}
