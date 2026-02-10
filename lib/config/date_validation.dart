bool expDate(String? value) {
  if (value == null || value.isEmpty) return false;

  final parts = value.split('/');
  if (parts.length != 2) return false;

  final month = int.tryParse(parts[0]);
  final year = int.tryParse(parts[1]);

  if (month == null || year == null || month < 1 || month > 12) {
    return false;
  }

  final now = DateTime.now();
  final expiryDate = DateTime(year, month + 1, 0);

  return expiryDate.isAfter(now);
}