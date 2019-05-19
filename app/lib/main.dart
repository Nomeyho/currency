import 'package:app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() async {
  runApp(ChangeNotifierProvider<AppState>(
    builder: (context) {
      final state = AppState();
      state.loadCurrencies().then((_) => print('Currencies loaded'));
      return state;
    },
    child: App(),
  ));
}
