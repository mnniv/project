import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 1, 32, 63),
    scaffoldBackgroundColor: Colors.blueGrey.shade200,
    
    
    
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: const Color.fromARGB(255, 37, 35, 35),
    
  );
}