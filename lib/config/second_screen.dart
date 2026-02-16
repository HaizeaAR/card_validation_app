



import 'package:flutter/material.dart';

class SeconsScreen extends StatelessWidget {
  const SeconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Second Screen'),
        ),
        body: const Center(
          child: Text('Credit Card Validated Successfully!',
              style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green)),
              )  
            ),
        );
  }



}