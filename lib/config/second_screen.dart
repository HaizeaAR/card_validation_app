import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Valid'),
      ),
      body: const Center(
        child: Text(
          'Ur credir card has been successfully validated!',
          style: TextStyle(fontFamily: 'Arial', fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
          textAlign: TextAlign.center,
        ),
      ),
    );  
  }
}