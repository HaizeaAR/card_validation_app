import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validador_tarjeta/config/card_info.dart';


class _ListDrop extends StatefulWidget { 
@override
  _ListDropState createState() => _ListDropState();
  }

  
class _ListDropState extends State<_ListDrop> {
  final items = ['Visa', 'MasterCard', 'American Express', 'Discover', 'Other']; String? selectedItem;
  String? value;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title:Text('Card type'), centerTitle: true),
    body:Center(
      child: DropdownButton<String>(
        items: items.map(buildMenuItem).toList(),
        onChanged: (value) => setState(() => this.value = value),
    )),
  );

  DropdownMenuItem<String> buildMenuItem(String item) => 
  DropdownMenuItem(
    value: item, 
    child: Text(
      item,
      style:TextStyle(fontSize: 20), 
      ),
    ); 
  }



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


