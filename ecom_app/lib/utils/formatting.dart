import 'package:intl/intl.dart';

String formatPrice(num value, {String currency = "PKR"}) {
  final nf = NumberFormat.currency(symbol: currency == "PKR" ? "₨" : "$", decimalDigits: 0);
  return nf.format(value);
}
