import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageValidate extends StatelessWidget {
  const MessageValidate({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        inputFormatters: [
        FilteringTextInputFormatter.digitsOnly // con esta linea haremos que solo permita solo números
  ],
        decoration: const InputDecoration(
        border: OutlineInputBorder(), 
        labelText: 'Credit card number'),
      ),
    );
    
  }
}