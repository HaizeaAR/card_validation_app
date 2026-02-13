import 'package:flutter/material.dart';
import 'package:validador_tarjeta/presentation/text_field.dart';
import 'package:validador_tarjeta/config/themes/app_theme.dart';
import 'package:validador_tarjeta/config/card_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: AppTheme.lightTheme,
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class DropList extends StatelessWidget {
  final CardType? value;
  final ValueChanged<CardType?> onChanged;

  const DropList({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: DropdownButton<CardType>(
          value: value,
          hint: const Text("Select card type"),
          isExpanded: true,
          items: const [
            DropdownMenuItem(
              value: CardType.visa,
              child: Text('Visa'),
            ),
            DropdownMenuItem(
              value: CardType.mastercard,
              child: Text('MasterCard'),
            ),
            DropdownMenuItem(
              value: CardType.amEx,
              child: Text('American Express'),
            ),
            DropdownMenuItem(
              value: CardType.discover,
              child: Text('Discover'),
            ),
            DropdownMenuItem(
              value: CardType.other,
              child: Text('Other'),
            ),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}


class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();

  CardType? selectedCardType;



  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardController = TextEditingController();
  final TextEditingController expController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Credit Card Validation'),

      ),
   body: SingleChildScrollView(
  child: Form(
    key: _formKey,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.all( 20),

      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Card Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
           
          DropList(
          value: selectedCardType,
          onChanged: (value) {
          setState(() {
          selectedCardType = value;
        });
      },
),

          
          const SizedBox(height: 10),
      
          FullName(controller: nameController),
          CreditCard(controller: cardController),
          ExpDate(controller: expController),
          Cvv(controller: cvvController,
          cardType: selectedCardType,
          ),

      
          const SizedBox(height: 20),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  debugPrint("Card is valid");
                }
              },
              child: const Text('Check validity'),
            ),
          ),
        ],
      ),
    
  ),
), 
   ),
    );
  }
}
