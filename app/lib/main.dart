import 'package:app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'i18n/app_i18n_delegate.dart';

void main() async {
  final state = AppState();
  final i18nDelegate = AppI18nDelegate();

  /// init
  state.loadCurrencies().then((_) => print('Currencies loaded'));

  runApp(App(state, i18nDelegate));
}
