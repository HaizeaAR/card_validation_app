  
import 'package:validador_tarjeta/config/date_validation.dart';
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

    //Uso un static para no tener que crear un objeto de la clase para usar los metodos de validacion
    static String? validateCVV(String? value) {
      //Primero penalizo al comprobar si el valor está vacío
      if (value == null || value.isEmpty) {
        return 'CVV no puede estar vacío';
      }
      //Luego compruebo que los dígitos entren dentro del rango establecido
      if (value.length < 3 || value.length > 4) {
        return 'CVV debe tener 3 o 4 dígitos';
      }
      //Si ha pasado ambas validaciones, es valido y no devuelve error
      return null; // CVV válido
    }
  
    
    static String? validateDate(String? value) {
      if (value == null || value.isEmpty) {
        return 'La fecha de caducidad no puede estar vacía';
      }
      //Aqui uso la variable ya creada en date_validation (donde se comprueba que la fecha es válida)
      if (expDate(value) == true) {
        return null;
    }
    //Si no ha pasado la validación, devuelvo el error
        return 'Fecha de caducidad inválida';
    } 
  

    String? validateCardNumber(String? value) {
     if (value == null || value.isEmpty) {
      return 'El número de tarjeta no puede estar vacío';
    }
    //Aqui uso la variable ya creada en card_number_validation (donde hice el algoritmo de Luhn para validar la tarjeta)
    if (luhn(value) == true) {
      return null;
    }
    //Si no ha pasado la validación, devuelvo el error
    return 'Número de tarjeta no válido';
  }

  //En el nombre la comprobación es más sencilla, solo penalizo si el valor está vacío 
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'El nombre no puede estar vacío';
    }
    //Si no esta vacio lo valido como válido
    return null; // Nombre válido
  } 
  
  }



