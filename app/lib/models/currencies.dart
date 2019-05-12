import 'currency.dart';

class Currencies {
  String date;
  List<Currency> currencies;

  Currencies();

  Currencies.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    currencies = json['currencies'].map((c) => Currency.fromJson(c)).toList().cast<Currency>();
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'currencies': currencies.map((c) => c.toJson()).toList(),
      };
}
