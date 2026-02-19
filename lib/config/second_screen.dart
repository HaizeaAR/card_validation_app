import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Valid')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/845/845646.png',
              width: 290,
              height: 210,
              errorBuilder: (context, error, stackTrace) {
                return Text('error ${error.toString()} ');
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Ur credit card has been successfully validated!',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
