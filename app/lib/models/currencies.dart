import 'currency.dart';

class Currencies {
  DateTime date;
  List<Currency> currencies;

  Currencies();

  Currencies.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    currencies = json['currencies'].map((c) => Currency.fromJson(c)).toList().cast<Currency>();
  }

  Map<String, dynamic> toJson() => {
        'date': '${date.year}-${date.month}-${date.day}',
        'currencies': currencies.map((c) => c.toJson()).toList(),
      };
}
