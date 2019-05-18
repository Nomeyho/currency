import 'package:app/models/currency.dart';
import 'package:app/models/currencies.dart';
import 'package:app/services/currency_service.dart';
import 'package:app/services/preference_service.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  final _ratesService = CurrencyService();
  final _preferenceService = PreferenceService();

  /// state
  Locale _locale;
  List<Currency> _currencies = [];
  Currency _from;
  Currency _to;
  bool _loading = true;

  Locale get locale => _locale;

  Future<void> setLocale(String lang) async {
    _locale = Locale(lang);
    _preferenceService.setLang(lang);
    notifyListeners();
  }

  Future<void> loadLocale() async {
    final lang = await _preferenceService.getLang() ?? 'en';
    _locale = Locale(lang);
    notifyListeners();
  }

  List<Currency> get currencies => _currencies;

  List<Currency> filteredCurrencies(String filter) {
    return currencies.where((c) => c.match(filter)).toList();
  }

  Future<void> loadCurrencies() async {
    _loading = true;
    notifyListeners();

    try {
      final data = await _ratesService.getRemoteCurrencies();
      _currencies = data.currencies;
    } catch (e) {
      print(e);
      final data = await _ratesService.getLocalCurrencies();
      _currencies = data.currencies;
    }

    _from = _currencies[0];
    _to = _currencies[1];
    _loading = false;
    notifyListeners();
  }

  Currency get from => _from;

  set from(Currency from) {
    _from = from;
    notifyListeners();
  }

  Currency get to => _to;

  set to(Currency to) {
    _to = to;
    notifyListeners();
  }

  double get rate => from.rate / to.rate;

  get loading => _loading;

  set loading(bool loading) {
    loading = loading;
    notifyListeners();
  }
}
