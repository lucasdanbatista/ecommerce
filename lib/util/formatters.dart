import 'package:intl/intl.dart';

String formatCurrency(double currency) =>
    NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(currency);
