import 'package:timeago/timeago.dart' as timeago;

class AppHelpers {
  AppHelpers._();

  static final _months = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
  ];

  static String getMonthByInt(int month) {
    return _months[month - 1];
  }

  static String getTimeAgo(DateTime date) {
    return timeago.format(date, locale: 'pt_BR');
  }

  static bool isValidEmail(String? email) {
    if (email == null) {
      return false;
    }

    final regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }
}
