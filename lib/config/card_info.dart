  
import 'package:validador_tarjeta/config/date_validation.dart';
import 'package:validador_tarjeta/config/card_number_validation.dart';
import 'package:validador_tarjeta/main.dart'; 

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
    static String? validateCVV(String? value, String? cardNumber) {
      if (value == null || value.isEmpty) {
        return 'CVV can\'t be empty';
      }
      //Aqui uso la variable ya creada en card_number_validation (donde se comprueba el tipo de tarjeta) para validar el CVV dependiendo del tipo de tarjeta, ya que no es lo mismo un CVV de una visa que de una ame
      if (DropListState().value == 'Visa' || DropListState().value == 'MasterCard' || DropListState().value == 'Discover' || DropListState().value == 'Other') {
        if (value.length != 3) {
          return 'CVV must be 3 digits'; 
        }
      } else if (DropListState().value == 'American Express') {
        if (value.length != 4) {
          return 'CVV must be 4 digits';
        }
      }
      //Si ha pasado ambas validaciones, es valido y no devuelve error
      return null; // CVV válido
    }

  
    
    static String? validateDate(String? value) {
      if (value == null || value.isEmpty) {
        return 'Expiration date can\'t be empty';
      }
      //Aqui uso la variable ya creada en date_validation (donde se comprueba que la fecha es válida)
      if (expDate(value) == true) {
        return null;
    }
    //Si no ha pasado la validación, devuelvo el error
        return 'Expiration date is invalid';
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



