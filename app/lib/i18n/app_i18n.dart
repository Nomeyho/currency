import 'dart:ui';

import 'package:flutter/material.dart';

class AppI18n {
  final Locale _locale;
  final Map<String, String> _translation;

  AppI18n(this._locale, this._translation);

  static AppI18n of(BuildContext context) {
    return Localizations.of<AppI18n>(context, AppI18n);
  }

  Locale get locale => _locale;

  String get title => _translation['title'];
}
