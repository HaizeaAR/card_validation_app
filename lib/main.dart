import 'package:flutter/material.dart';
import 'package:validador_tarjeta/presentation/text_field.dart';
import 'config/themes/app_theme.dart';


void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(selectedColor: 1).theme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: const Text('Validador de tarjetas'),
       ),
        body: Column(
          children: [
            FullName(),
            CreditCard(),
            Cvv(),
            ExpDate(),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Introduce el número de tarjeta:')
          ],
          ),
        ),
    );
  }
}
