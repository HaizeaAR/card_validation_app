import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageValidate extends StatelessWidget {
  const MessageValidate({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
    child: SizedBox(
      width: 250,
      child: TextField(
        inputFormatters: [
        FilteringTextInputFormatter.digitsOnly // con esta linea haremos que solo permita solo números
  ],
        decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Credit card number',
        hintText: '400 1234 5678 9010',
        ),
        ),
      ),
    );
  }
}

class MessageCvv extends StatelessWidget {
  const MessageCvv({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
    child: SizedBox(
      width: 250,
      child: TextField(
        obscureText: true, // con esta linea haremos que el texto se oculte al escribirlo
        inputFormatters: [
        LengthLimitingTextInputFormatter(3), // con esta linea haremos que solo permita 3 caracteres
        FilteringTextInputFormatter.digitsOnly // con esta linea haremos que solo permita solo números
  ],
        decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'CVV',
        hintText: '123',
        ),
        ),
      ),
    );
  }
}

class MessageName extends StatelessWidget {
  const MessageName({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
    child: SizedBox(
      width: 250,
      child: TextField(
        inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // con esta linea haremos que solo permita letras y espacios
  ],
        decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Cardholder name',
        hintText: 'Haizea Ariza Robleda',
        ),
        ),
      ),
    );
  }
}