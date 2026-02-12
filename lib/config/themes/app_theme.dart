import 'package:flutter/material.dart';

const Color buttonColor = Color.fromARGB(255, 128, 152, 198);

class AppTheme { 
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.orange,
      hintColor: Colors.grey,
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          textStyle: const TextStyle(
            color: Color.fromARGB(255, 39, 22, 91),
            fontSize: 16
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          color: Colors.blue,
          fontSize: 18
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
    );
    
  }

}