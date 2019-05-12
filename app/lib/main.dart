import 'package:app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() async {
  final state = AppState();
  state.loadCurrencies().then((_) => print('Currencies loaded'));
  state.locale = Locale('en');

  runApp(ChangeNotifierProvider<AppState>(
    builder: (context) => state,
    child: App(),
  ));
}
