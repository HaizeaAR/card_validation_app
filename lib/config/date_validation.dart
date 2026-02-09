bool expDate(int month, int year) {
  //con DataTime.now saco la fecha actual, luego consigo los valores de mes y saño para poder compararlos con el currentYear y currentMonth
  final now = DateTime.now();
  final currentYear = now.year;
  final currentMonth = now.month;

  //Comparo los valores actuales con los que se han introducido manual en el validador
  if (year < currentYear) {
    return false; // El año es menor que el actual
  } else if (year == currentYear && month < currentMonth) {
    return false; // El año es el actual pero el mes es menor
  } else if (month < 1 || month > 12) {
    return false; // Mes no válido
  }

  return true; // La fecha es válida
}