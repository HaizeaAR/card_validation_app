import 'package:flutter/material.dart';
import 'package:validador_tarjeta/presentation/text_field.dart';
import 'package:validador_tarjeta/config/themes/app_theme.dart';
import 'package:validador_tarjeta/config/card_info.dart';
import 'config/second_screen.dart';

//runApp inicializa el widget de MyApp
void main() {
  runApp(const MyApp());
}

//El cuerpo de la aplicion completa
//Stateless no guarda la informacion
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

//Con el Stateful si guardo informacion (lo necesito para las variables mas tarde), para el formulario
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Con la DropList creo un desplegable para la seleccion del tipo de tarjeta
class DropList extends StatelessWidget {
  //Esta parte guarda el valor que ha sido seleccionado, osease, el tipo de tarjeta
  final CardType? value;
  //Cuando se selecciona otro valor, esta es la variable que caambia
  final ValueChanged<CardType?> onChanged;

  //Los requerimientos para la constante de la DropList
  const DropList({super.key, required this.value, required this.onChanged});

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
        //Aqui se crea como tal el DropList, con sus valores y textos
        child: DropdownButton<CardType>(
          value: value,
          hint: const Text("Select card type"),
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: CardType.visa, child: Text('Visa')),
            DropdownMenuItem(
              value: CardType.mastercard,
              child: Text('MasterCard'),
            ),
            DropdownMenuItem(
              value: CardType.amEx,
              child: Text('American Express'),
            ),
            DropdownMenuItem(value: CardType.discover, child: Text('Discover')),
            DropdownMenuItem(value: CardType.other, child: Text('Other')),
          ],
          //Llama a la funcion de antes cuando hay un cambio de eleccion
          onChanged: onChanged,
        ),
      ),
    );
  }
}

//Clase para el formulario
class _MyHomePageState extends State<MyHomePage> {
  //Clave global para el formulario
  final _formKey = GlobalKey<FormState>();

  //Variable que guarda el tipo de carta que ha sido seleccionada
  CardType? selectedCardType;

  //Los controladores del texto que ha sido ingresado en los campos correspondientes
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardController = TextEditingController();
  final TextEditingController expController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //La barra superior de la aplicacion
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Credit Card Validation'),
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Card Information",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                //El SizedBox nos genera un espacio transparante para separar los widgets en la pantalla
                const SizedBox(height: 15),

                //El widget del DropList con sus valores
                DropList(
                  value: selectedCardType,
                  onChanged: (value) {
                    setState(() {
                      selectedCardType = value;
                    });
                  },
                ),

                const SizedBox(height: 5),

                //Las partes del formulario y sus controladores para los input
                FullName(controller: nameController),
                CreditCard(controller: cardController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: ExpDate(controller: expController)),

                    const SizedBox(height: 5),

                    Expanded(
                      child: Cvv(
                        controller: cvvController,
                        cardType: selectedCardType,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                //El boton que valida el formulario
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      //Ejecuta una validacion en función de la propia validación de la key
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SecondScreen(),
                          ),
                        );
                      }
                    },

                    child: const Text('Check validity'),
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.reset();

                      nameController.clear();
                      cardController.clear();
                      expController.clear();
                      cvvController.clear();

                      setState(() {
                        selectedCardType = null;
                      });
                    },
                    child: const Text('Reset credentials'),
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
