import 'package:flutter/material.dart';
import 'package:validador_tarjeta/presentation/text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();


  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardController = TextEditingController();
  final TextEditingController expController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Card Validation'),
      ),
   body: SingleChildScrollView(
  child: Form(
    key: _formKey,
    child: Column(
      children: [
        FullName(controller: nameController),
        CreditCard(controller: cardController),
        ExpDate(controller: expController),
        Cvv(controller: cvvController),

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
    );
  }
}

