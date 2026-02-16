import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validador_tarjeta/config/card_info.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


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

  CreditCardmask() => MaskTextInputFormatter(mask: '#### #### #### ####');
   @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          inputFormatters: [
            CreditCardmask(),
            LengthLimitingTextInputFormatter (16)
              ],
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
  final CardType? cardType;

  const Cvv({
    super.key,
    required this.controller,
    required this.cardType,
  });



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
            LengthLimitingTextInputFormatter(
              cardType == CardType.amEx ? 4 : 3,
            ),
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'CVV',
            hintText: '123',
          ),
          validator: (value) =>
              CardUtils.validateCVV(value, cardType),
        ),
      ),
    );
  }
}



class ExpDate extends StatelessWidget {
  
  final TextEditingController controller;
  const ExpDate({super.key, required this.controller});
  
  get dateMask => MaskTextInputFormatter(mask: '##/##');
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 20),

      child: Padding(  
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          keyboardType: TextInputType.datetime,
          inputFormatters: [
            dateMask,
            LengthLimitingTextInputFormatter(5),
          ],
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Expiration Date',
            hintText: 'MM/YY',
          ),
          validator: CardUtils().validateCardDate,
        ),
      )
    );
  }
}