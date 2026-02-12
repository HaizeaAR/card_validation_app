import 'package:flutter/material.dart';
import 'package:validador_tarjeta/config/card_info.dart';


class FullName extends StatelessWidget {
  final TextEditingController controller;

  const FullName({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Type your name',
          hintText: 'Juan Carlos Pavón Godoy'
        ),
        validator: CardUtils().validateName,
      )
    );
        }
  }

    


class CreditCard extends StatelessWidget {
  final TextEditingController controller;

  const CreditCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Card Number',
          hintText: '1234 5678 9012 3456',
        ),
        validator: CardUtils().validateCardNumber,
      ),
    );
  }
}



class Cvv extends StatelessWidget {
  final TextEditingController controller;

  const Cvv({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'CVV',
          hintText: '123',
        ),
        validator: CardUtils.validateCVV,
      ),
    );
  }
}


class ExpDate extends StatelessWidget {
  final TextEditingController controller;

  const ExpDate({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Expiration Date',
        ),
        validator: CardUtils.validateDate,
      ),
      );
  }
}


