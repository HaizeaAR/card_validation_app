import 'package:flutter/material.dart';
import 'package:validador_tarjeta/presentation/text_field.dart';



void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Validador de tarjetas'),
        ),
        body: const FullName(),
        ),
      );
  
  }
}
