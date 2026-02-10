bool expDate(String? value) {
  //Si no hay valor o el valor es vacío, la fecha no es válida directamente
  if (value == null || value.isEmpty) return false;

  //Divido el valor en dos partes usando el '/' como separador, para obtener el mes y el año
  final parts = value.split('/');
  //Si no hay dos partes (mes y año), la fecha no es válida
  if (parts.length != 2) return false;

  //Intento convertir el mes y el año a enteros con el método tryParse, que devuelve null si la conversión falla
  final month = int.tryParse(parts[0]);
  final year = int.tryParse(parts[1]);

  //Si el mes o el año estan vacios, o si el mes no está entre 1 y 12, la fecha no es válida
  if (month == null || year == null || month < 1 || month > 12) {
    return false;
  }

  //Creo la fecha actual 
  final now = DateTime.now();
  //Creo la fecha final del mes de caducidad
  final expiryDate = DateTime(year, month + 1, 0);
  //Comparo la fecha de caducidad con la fecha actual, si la fecha de caducidad es después de la fecha actual, la tarjeta es válida
  return expiryDate.isAfter(now);
}