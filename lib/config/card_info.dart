  
import 'package:validador_tarjeta/config/date_validation.dart';
import 'package:validador_tarjeta/config/card_number_validation.dart';

class CardInfo {

  CardType? type;
  String? cardNumber;
  String? name;
  int? month;
  int? year;
  int? cvv;


  CardInfo({
    this.type,
    this.cardNumber,
    this.name,
    this.month,
    this.year,
    this.cvv
  });
}


  enum CardType {
    visa,
    mastercard,
    amEx,
    discover,
    other
  }

  class CardUtils {
    static String? validateCVV(String? value) {
      if (value == null || value.isEmpty) {
        return 'CVV no puede estar vacío';
      }
      if (value.length < 3 || value.length > 4) {
        return 'CVV debe tener 3 o 4 dígitos';
      }
      return null; // CVV válido
    }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'La fecha de caducidad no puede estar vacía';
    }
    if (expDate == true) {
      return null;
  }
  
    return null;
  }
  }

  String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'El número de tarjeta no puede estar vacío';
    }
    if (validateCardNumber(value) == true) {
      return null;
    }
    return 'Número de tarjeta no válido';

  
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'El nombre no puede estar vacío';
    }
    return null; // Nombre válido
  } 

  
