import 'package:validador_tarjeta/config/card_number_validation.dart';

//Aqui represento la información de la tarjeta, con sus atributos y un constructor para inicializarlos, ademas de una clase con métodos para validar cada uno de los atributos de la tarjeta
class CardInfo {

  //Aqui defino los atributos de la tarjeta que voy a pedir en el input
  //Con el cardtype lo que hago es definir el tipo de tarjeta
  CardType? type;
  //Pare el cardNumber uso un STRING por si tenemos un valor 0 el inicio de la tarjeta (int no guarda ese valor, lo elemina)
  String? cardNumber;
  String? name;
  int? month;
  int? year;
  //Aqui hago lo mismo que con el cardNumber, uso un String para el CVV por si tiene un 0 al inicio, ademas de que el CVV no se va a usar para cálculos
  String? cvv;


  //Con el this inicializo los atributos que voy a pedir en el input
  CardInfo({
    this.type,
    this.cardNumber,
    this.name,
    this.month,
    this.year,
    this.cvv
  });
}

  //Enum para los tipos de tarjeta (represento valores constantes)
  enum CardType {
    visa,
    mastercard,
    amEx,
    discover,
    other
  }


//Comienzo la clase con los metodos de validación para luego usarlos dentro del text_field y validar o mostrar los errores de la validaación de la tarjeta
class CardUtils {

  //Asi validamos el CVV con el tipo de tarjeta que se introduce en el despleglable
  static String? validateCVV(String? value, CardType? type) {
    //Si el valor esta vacio, lanzamos error
    if (value == null || value.isEmpty) {
      return 'CVV can\'t be empty';
  }
    //Lanzamos otro error si no seleccionamos un tipo de tarjeta
    if (type == null) {
      return 'Please select a card type first';
  }
    //Si la tarjeta seleccionada es AmEx, hacemos una restricción para que pida 4 digitos
    if (type == CardType.amEx) {
      if (value.length != 4) {
        return 'CVV must be 4 digits for American Express';
    }
    //Si es cualquiera de los otros tipos de tarjeta, lo dejamos con 3 digitos de restriccion
  } else {
    if (value.length != 3) {
      return 'CVV must be 3 digits';
    }
  }

        return null;
}

  
 String? validateCardDate(String? value) {
  if (value == null || value.isEmpty) {
    return 'Required field';
  }

  // formato MM/YY (dos dígitos, barra, dos dígitos)
  final RegExp regex = RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$');
  if (!regex.hasMatch(value)) {
    return 'MM/YY innvalid';
  }

  // Validación lógica: Mes y Año
  final List<String> parts = value.split('/');
  final int month = int.parse(parts[0]);
  final int year = int.parse(parts[1]);

  final DateTime now = DateTime.now();
  // Asumimos 20xx para el año
  final int currentYear = int.parse(now.year.toString().substring(2));
  final int currentMonth = now.month;

  if (year < currentYear || (year == currentYear && month < currentMonth)) {
    return 'Expired card';
  }

  return null; // Válido
}
  

  String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Card number can\'t be empty';
    }
    //Aqui uso la variable ya creada en card_number_validation (donde hice el algoritmo de Luhn para validar la tarjeta)
    if (luhn(value) == true) {
      return null;
    }
    //Si no ha pasado la validación, devuelvo el error
      return 'Card number is invalid';
  }

  //En el nombre la comprobación es más sencilla, solo penalizo si el valor está vacío 
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name can\'t be empty';
    }
    //Si no esta vacio lo valido como válido
      return null; // Nombre válido
  } 
}
