import 'package:app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'i18n/app_i18n_delegate.dart';
import 'i18n/languages.dart';
import 'state/app_state.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return new MaterialApp(
      title: 'Currency',
      theme: new ThemeData(),
      home: new HomeScreen(),
      locale: state.locale,
      localizationsDelegates: [
        AppI18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: languages.map((l) => Locale(l, '')),
    );
  }
}
