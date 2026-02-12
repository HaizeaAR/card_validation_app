import 'package:flutter/material.dart';
import 'package:validador_tarjeta/presentation/text_field.dart';
import 'package:validador_tarjeta/config/themes/app_theme.dart';

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
      theme: AppTheme.lightTheme
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _DropList extends StatefulWidget { 
@override
  _DropListState createState() => _DropListState();
  }

  
class _DropListState extends State<_DropList> {
  final items = ['Visa', 'MasterCard', 'American Express', 'Discover', 'Other'];
String? value;

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
      child: DropdownButton<String>(
        value: value,
        hint: const Text("Select card type"),
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        items: items.map(buildMenuItem).toList(),
        onChanged: (value) => setState(() => this.value = value),
      ),
    ),
  );
}


  DropdownMenuItem<String> buildMenuItem(String item) => 
  DropdownMenuItem(
    value: item, 
    child: Text(
      item,
      style:TextStyle(fontSize: 20), 
      ),
    ); 
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
        _DropList(),
        
        const SizedBox(height: 10),

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

