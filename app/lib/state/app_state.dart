import 'package:app/models/currency.dart';
import 'package:app/services/currency_service.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  final _ratesService = CurrencyService();

  /// state
  List<Currency> _currencies = [];
  DateTime _date;
  Currency _from;
  Currency _to;
  bool _loading = true;

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
      _date = data.date;
    } catch (e) {
      print(e);
      final data = await _ratesService.getLocalCurrencies();
      _currencies = data.currencies;
      _date = data.date;
    }

    _from = _currencies.firstWhere((c) => c.code == 'EUR'); // TODO use preferences to save last two selected
    _to = _currencies.firstWhere((c) => c.code == 'USD');
    _loading = false;
    notifyListeners();
  }

  void invert() {
    final tmp = from;
    _from = _to;
    _to = tmp;
    notifyListeners();
  }

  DateTime get date => _date;

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
