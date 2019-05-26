import 'package:app/models/favorites.dart';
import 'package:app/models/currencies.dart';
import 'package:app/models/currency.dart';
import 'package:app/services/currency_service.dart';
import 'package:app/services/favorites_service.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  final _ratesService = CurrencyService();
  final _favoritesService = FavoritesService();

  /// state
  Currencies _currencies = Currencies();
  Favorites _favorites = Favorites.empty();
  Currency _from;
  Currency _to;
  bool _loading = true;

  List<Currency> get currencies => _currencies.currencies;

  List<Currency> getCurrencies(String filter) {
    final List<Currency> currencies = [];

    // favorites
    currencies.addAll(_favorites
        .toList()
        .map((code) => _currencies.find(code))
        .where((c) => c.match(filter))
        .map((c) => c.setIsFavorite(true))
        .toList());

    // non-favorites
    currencies.addAll(_currencies.currencies
        .where((c) => !_favorites.contains(c.code))
        .where((c) => c.match(filter))
        .map((c) => c.setIsFavorite(false))
        .toList());

    return currencies;
  }

  Future<void> loadCurrencies() async {
    _loading = true;
    notifyListeners();

    try {
      _currencies = await _ratesService.getRemoteCurrencies();
    } catch (e) {
      print(e);
      _currencies = await _ratesService.getLocalCurrencies();
    }

    _favorites = await _favoritesService.getFavorites();
    _from = currencies.firstWhere((c) => c.code == 'EUR'); // TODO use preferences to save last two selected
    _to = currencies.firstWhere((c) => c.code == 'USD');
    _loading = false;
    notifyListeners();
  }

  void invert() {
    final tmp = from;
    _from = _to;
    _to = tmp;
    notifyListeners();
  }

  DateTime get date => _currencies.date;

  Currency get from => _from;

  set from(Currency from) {
    _from = from;
    _favorites.add(from.code);
    _favoritesService.saveFavorites(_favorites);
    notifyListeners();
  }

  Currency get to => _to;

  set to(Currency to) {
    _to = to;
    _favorites.add(to.code);
    _favoritesService.saveFavorites(_favorites);
    notifyListeners();
  }

  double get rate => from.rate / to.rate;

  get loading => _loading;

  set loading(bool loading) {
    loading = loading;
    notifyListeners();
  }
}
