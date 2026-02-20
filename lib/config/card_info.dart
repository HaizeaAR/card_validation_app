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
    this.cvv,
  });
}

//Enum para los tipos de tarjeta (represento valores constantes)
enum CardType { visa, mastercard, amEx, discover, other }

bool _matchesCardType(String value, CardType type) {
  switch (type) {
    case CardType.visa:
      return value.startsWith('4');
    case CardType.mastercard:
      return value.startsWith(RegExp(r'5[1-5]'));
    case CardType.amEx:
      return value.startsWith('34') || value.startsWith('37');
    case CardType.discover:
      return value.startsWith('6');
    default:
      return true;
  }
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

    // Formato MM/YY
    final RegExp regex = RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$');
    if (!regex.hasMatch(value)) {
      return 'MM/YY innvalid';
    }

    // Validación del Mes y Año
    final List<String> parts = value.split('/');
    final int month = int.parse(parts[0]);
    final int year = int.parse(parts[1]);

    final DateTime now = DateTime.now();
    // Asumimos que el año siempre estara por los 2000's
    final int currentYear = int.parse(now.year.toString().substring(2));
    final int currentMonth = now.month;

    //Damos error de tarjeta caducada si ambas variables no siguen las restricciones
    if (year < currentYear || (year == currentYear && month < currentMonth)) {
      return 'Expired card';
    }

    return null; // Válido
  }

  String? validateCardNumber(String? value, CardType? type) {
    if (value == null || value.isEmpty) {
      return 'Card number can\'t be empty';
    }

    if (type == null) {
      return 'Please select a card type first';
    }

    if (!_matchesCardType(value, type)) {
      return 'Card number does not match selected card type';
    }

    if (!luhn(value)) {
      return 'Card number is invalid';
    }

    return null;
  }

  //En el nombre la comprobación es más sencilla, solo penalizo si el valor está vacío
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name can\'t be empty';
    }
    //Si no esta vacio lo valido como válido
    return null;
  }
}
