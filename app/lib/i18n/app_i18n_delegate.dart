import 'dart:convert';

import 'package:app/utils/json_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_i18n.dart';
import 'languages.dart';

class AppI18nDelegate extends LocalizationsDelegate<AppI18n> {
  @override
  bool isSupported(Locale locale) => languages.contains(locale.languageCode);

  @override
  Future<AppI18n> load(Locale locale) async {
    String string = await loadJsonFromAsset(locale.languageCode);
    Map<String, dynamic> json = jsonDecode(string);
    Map<String, String> translation = convertValueToString(json);
    return AppI18n(locale, translation);
  }

  @override
  bool shouldReload(AppI18nDelegate old) => false;

  Future<String> loadJsonFromAsset(language) async {
    return await rootBundle.loadString('assets/i18n/$language.json');
  }
}
