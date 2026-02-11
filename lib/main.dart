import 'package:flutter/material.dart';
import 'package:validador_tarjeta/presentation/text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Card Form'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            FullName(),
            CreditCard(),
            ExpDate(),
            Cvv(),
          ],
        ),
      ),
    );
  }
}
