import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validador_tarjeta/config/card_info.dart';


class FullName extends StatefulWidget {
  const FullName ({super.key});

  @override
  _FullNameState createState() => _FullNameState();
}

class _FullNameState extends State<FullName>{
@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text('Full name:'),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), 
            ],
            decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Type ur name here',
            hintText: 'Juan Carlos Pavón Godoy',
            ),
          ),
        ),
      ],
    );
  }
}
class CreditCard extends StatefulWidget {
  const CreditCard ({super.key});

  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard>{
@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text('Credit card number:'),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(19),
            ],
          decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Card Number',
          hintText: '400 1234 5678 9010',
            ),
            validator:CardUtils().validateCardNumber,
          ),
        ),
      ],
    );
  }
}

class Cvv extends StatefulWidget {
  const Cvv ({super.key});

  @override
  _CvvState createState() => _CvvState();
}

class _CvvState extends State<Cvv>{
@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text('CVV:'),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'CVV',
              hintText: '123',
            ),
          ),
        ),
      ],
    );
  }
}
class ExpDate extends StatefulWidget {
  const ExpDate ({super.key});

  @override
  _ExpDateState createState() => _ExpDateState();
}

class _ExpDateState extends State<ExpDate>{
@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text('Exp date:'),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(5),
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Exp date',
              hintText: '12/25',
            ),
          ),
        ),
      ],
    );
  }
}

