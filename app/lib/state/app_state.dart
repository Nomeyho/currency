import 'package:app/models/currency.dart';
import 'package:app/models/currencies.dart';
import 'package:app/services/currency_service.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  final _ratesService = CurrencyService();

  /// state
  Locale _locale;
  List<Currency> _currencies = [];
  Currency _from;
  Currency _to;
  bool _loading = true;

  Locale get locale => _locale;

  set locale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  List<Currency> get currencies => _currencies;

  List<Currency> filteredCurrencies(String filter) {
    return currencies.where((c) => c.match(filter)).toList();
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
}
