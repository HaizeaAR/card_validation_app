import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validador_tarjeta/main.dart';
import 'package:validador_tarjeta/config/card_info.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FullName extends StatelessWidget {
  final TextEditingController controller;

  const FullName({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"[a-zA-ZÀ-ÿ\s]")),
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Type your name',
            hintText: 'Juan Carlos Pavón Godoy',
          ),
          validator: CardUtils().validateName,
        ),
      ),
    );
  }
}

class CreditCard extends StatelessWidget {
  final TextEditingController controller;
  final CardType? cardType;

  CreditCard({super.key, required this.controller, required this.cardType});

  final MaskTextInputFormatter _cardMask = MaskTextInputFormatter(
    mask: '#### #### #### ####',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      margin: const EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: controller,
        inputFormatters: [
          _cardMask,
          LengthLimitingTextInputFormatter(cardType == CardType.amEx ? 17 : 19),
        ],
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Card Number',
          hintText: '4000 1234 5678 9010',
        ),
        validator: (value) => CardUtils().validateCardNumber(value, cardType),
      ),
    );
  }
}

class Cvv extends StatelessWidget {
  final TextEditingController controller;
  final CardType? cardType;

  const Cvv({super.key, required this.controller, required this.cardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),

        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(cardType == CardType.amEx ? 4 : 3),
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'CVV',
            hintText: '123',
          ),
          validator: (value) => CardUtils.validateCVV(value, cardType),
        ),
      ),
    );
  }
}

class ExpDate extends StatelessWidget {
  final TextEditingController controller;
  ExpDate({super.key, required this.controller});

  final dateMask = MaskTextInputFormatter(mask: '##/##');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: TextFormField(
          controller: controller,
          inputFormatters: [dateMask, LengthLimitingTextInputFormatter(5)],
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Expiration Date',
            hintText: 'MM/YY',
          ),
          validator: CardUtils().validateCardDate,
        ),
      ),
    );
  }
}
