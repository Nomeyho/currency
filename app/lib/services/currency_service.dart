import 'dart:convert';

import 'package:app/models/currencies.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class CurrencyService {
  static String url = 'https://s3-eu-west-1.amazonaws.com/nomeyho-currency-prod/currencies.json';
  static String defaultCurrenciesFile = 'assets/default_currencies.json';
  static Map headers = {'Content-Type': 'application/json;chartset=utf-8'};

  Future<Currencies> getLocalCurrencies() async {
    print('Loading currencies from "$defaultCurrenciesFile" (default)');

    String string = await rootBundle.loadString(defaultCurrenciesFile);
    Map<String, dynamic> json = jsonDecode(string);

    return Currencies.fromJson(json);
  }

  Future<Currencies> getRemoteCurrencies() async {
    print('Loading currencies from "$url"');
    final response = await http.get(url, headers: headers);

    if (response.statusCode != 200) {
      print(response.body);
      throw Exception("Failed to fetch remote currencies");
    }

    return Currencies.fromJson(jsonDecode(response.body));
  }
}
