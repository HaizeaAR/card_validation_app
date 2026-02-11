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
          children: [
            FullName(),
            CreditCard(),
            ExpDate(),
            Cvv(),

          SizedBox(height: 20),

          Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            onPressed: () { 
            },
            style:ElevatedButton.styleFrom(
              minimumSize:Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            
            child: Text('Check validity'),
          ),
          ), 
          ],
        ),
      ),
    );
  }
}
