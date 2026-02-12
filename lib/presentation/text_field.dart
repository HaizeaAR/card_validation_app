import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validador_tarjeta/config/card_info.dart';




class FullName extends StatelessWidget {
  final TextEditingController controller;

  const FullName({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
            ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Type your name',
            hintText: 'Juan Carlos Pavón Godoy'
          ),
          validator: CardUtils().validateName,
        )
      ),
    );
        }
  }

    


class CreditCard extends StatelessWidget {
  final TextEditingController controller;

  const CreditCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(14),],
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Card Number',
            hintText: '400 123 456 78910',
          ),
          validator: CardUtils().validateCardNumber,
        ),
      ),
    );
  }
}



class Cvv extends StatelessWidget {
  final TextEditingController controller;

  const Cvv({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
              
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'CVV',
            hintText: '123',
          ),
          validator: CardUtils.validateCVV,
        ),
      ),
    );
  }
}


class ExpDate extends StatelessWidget {
  final TextEditingController controller;

  const ExpDate({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 20),

      child: Padding(  
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
             ],
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Expiration Date',
          ),
          validator: CardUtils.validateDate,
        ),
        ),
    );
  }
}


