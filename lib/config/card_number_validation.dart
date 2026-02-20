bool luhn(String cardNumber) {
  cardNumber = cardNumber.replaceAll(' ', '');

  //EL int de la suma la inicializo a 0 para usarla para guardar la suma de todos los digitos de la tarjeta y creo un booleano llamado alternate que va a encargarse de determinar el uso de los digitos
  int sum = 0;
  bool alternate = false;

  //Asi se recorre la tarjeta de derecha a izquiderda, saltando un numero desde el primero
  //Como el indice empieza en 0, hago el -1 para inicializarlo en el 1
  //El i>=0 implica que cuando llegue a algo menor que 0 pare (al final de la tarjeta)
  //El i-- determina que vamos a ir saltando una posición en el recorrido

  for (int i = cardNumber.length - 1; i >= 0; i--) {
    //parse es la forma de convertir un String a un int, en este caso el número de la tarjeta
    int n = int.parse(cardNumber[i]);

    //Alternate va a ser la variable que nos va a indicar si el numero va as er usado (el que sea alternado)
    //Ejemplo: 1234567890123456; Aqui alternate va a inicializar en false (6), sin usar ese numero, luego al recorrer el algoritmo va a cambiar el valor a true y usar el siguiente digito (5) y asi sucesivamente

    if (alternate) {
      n *= 2;
      if (n > 9) {
        n -= 9;
      }
    }

    //+= para sumar y guardar el resultado de TODOS los digitos de la tarjeta (alternados y no)
    sum += n;
    //Aqui con el ! cambio el valor del alternatte de forma sucesiva al final de cada vuelta del algoritmo, creando asi la alternancia
    alternate = !alternate;
  }

  //Aqui simplemente con el MOD compruebo si es divisible perfectamente por 10, para así validar la tarjeta
  if (sum % 10 == 0) {
    return true;
  } else {
    return false;
  }
}
