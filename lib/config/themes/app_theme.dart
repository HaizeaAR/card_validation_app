import 'package:flutter/material.dart';

const Color buttonColor = Color.fromARGB(255, 128, 152, 198);

class AppTheme { 
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.orange,
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          textStyle: const TextStyle(
            color: Color.fromARGB(255, 39, 22, 91),
            fontSize: 16
          ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
      ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle( color: Colors.grey, fontSize: 16 ),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          color: Colors.blue,
          fontSize: 18
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 36, 185, 23), width: 2.0),
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