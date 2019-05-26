import 'currency.dart';

class Currencies {
  DateTime date;
  Map<String, Currency> _currencies = {}; // code <-> currency

  Currencies();

  List<Currency> get currencies => _currencies.values.toList();

  bool contain(String code) {
    return _currencies.containsKey(code);
  }

  Currency find(String code) {
    return _currencies[code];
  }

  Currencies.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);

    json['currencies']
        .map((c) => Currency.fromJson(c))
        .toList()
        .cast<Currency>()
        .forEach((c) => _currencies[c.code] = c);
  }

  Map<String, dynamic> toJson() => {
        'date': '${date.year}-${date.month}-${date.day}',
        'currencies': _currencies.values.map((c) => c.toJson()).toList(),
      };
}
