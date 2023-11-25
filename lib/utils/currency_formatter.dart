import 'package:intl/intl.dart';

String formatCurrency(double amount,
    {String locale = 'id_ID', String symbol = 'Rp '}) {
  NumberFormat currencyFormat = NumberFormat.currency(
    locale: locale,
    symbol: symbol,
  );
  return currencyFormat.format(amount);
}
