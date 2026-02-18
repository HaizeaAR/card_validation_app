import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Valid'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network( "https://www.mastercard.pt/content/dam/public/mastercardcom/eu/pt/images/consumers/find-card/prepaid-cards/standard/ma_card_hrz_mm_prepaid_teal-2025.png",
            width: 290,
            height: 210,
          ),
           const SizedBox(height: 20),
           const                                                                                                     
          Text(
            'Ur credit card has been successfully validated!',
            style: TextStyle(fontFamily: 'Arial', fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      ),
    );  
  }
}