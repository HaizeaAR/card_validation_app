import 'package:flutter/material.dart';

//Una constante para guardar un color especifico para usarlo luego dentro del theme
const Color buttonColor = Color.fromARGB(255, 128, 152, 198);

class AppTheme { 
  //Creo un theme especifico para el modo claro (será el único modo en esta App)
  static ThemeData get lightTheme {
    return ThemeData(
      //Color primario de la App
      primarySwatch: Colors.orange,
      //Color de fondo de la App
      scaffoldBackgroundColor: Colors.white,
      //Aquí creo una función entera para el botón
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
      //Más decoración para la App 
      inputDecorationTheme: const InputDecorationTheme(
        //El texto chivato lo coloco en gris (como se ve usualmente en este tipo de apps)
        hintStyle: TextStyle( color: Color.fromARGB(201, 180, 180, 180), fontSize: 16 ),
        //El borde y texto de los campos de textos lo pongo en un tono verdoso
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          color: Color.fromRGBO(5, 111, 30, 1),
          fontSize: 18
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 36, 185, 23), width: 2.0),
        ),
        //Aquí, con los errores, hago que salga el texto en rojo y el campo pase a verse rojo también para enfatizar el error al usuario
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