import 'package:flutter/material.dart';

class CardValidationScreen extends StatelessWidget {
  const CardValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validador de tarjetas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Introduce el número de tarjeta:')
          ],
        ),
      ),
    );
  }
} 