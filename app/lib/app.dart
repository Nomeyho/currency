import 'package:app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'i18n/app_i18n_delegate.dart';
import 'i18n/languages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.grey[50],
        primaryColor: Color(0xFF8e2d3c),
        accentColor: Color(0xFF8e2d3c)
      ),
      home: HomeScreen(),
      localizationsDelegates: [
        AppI18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: languages.map((l) => Locale(l, '')),
    );
  }
}
