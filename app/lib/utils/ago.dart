import 'package:app/i18n/app_i18n.dart';

String ago(DateTime date, AppI18n locale) {
  if(date == null) {
    return '';
  }

  final Duration diff = DateTime.now().difference(date);
  final days = diff.inDays;

  if (days < 1) {
    return locale.text('home_screen.updated-today');
  } else if (days == 1) {
    return locale.text('home_screen.updated-day');
  } else {
    return locale
        .text('home_screen.updated-days')
        .replaceAll('%', days.toString());
  }
}