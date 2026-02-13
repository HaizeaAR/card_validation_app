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

  
    
  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Expiration date can\'t be empty';
    }
  //Dividimos el valor usando una barra
  final parts = value.split('/');
    //Si no hay dos separaciones, lanzamos un error por formato
    if (parts.length != 2) {
      return 'Expiration date must be in MM/YY format';
    }
  //Pasamos el mes y año a enteros con el tryParse,que devuelve null si la conversión falla
  final month = int.tryParse(parts[0]);
  final year = int.tryParse(parts[1]);
    //Otra restricción para lanzar error si el mes no está entre 1 o 12 o si no son números validos
    if (month == null || year == null || month < 1 || month > 12) {
      return 'Invalid expiration date';
    }
  //Creo una variable con la fecha actual y otra con la de caducidad para comparar los valores
  final now = DateTime.now();
  final expiryDate = DateTime(year, month + 1, 0);
    //Compruebo con la variable si la tarjeta está caducada
    if (!expiryDate.isAfter(now)) {
      return 'Card has expired';
    }

      return null;
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
