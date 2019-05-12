import 'package:app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'i18n/app_i18n_delegate.dart';
import 'i18n/languages.dart';
import 'state/app_state.dart';

class App extends StatelessWidget {
  final AppState state;
  final AppI18nDelegate appI18nDelegate;

  App(this.state, this.appI18nDelegate);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      builder: (context) => state,
      child: new MaterialApp(
        title: 'Currency',
        theme: new ThemeData(),
        home: new HomeScreen(),
        localizationsDelegates: [
          appI18nDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: languages.map((l) => Locale(l, '')),
      ),
    );
  }
}
