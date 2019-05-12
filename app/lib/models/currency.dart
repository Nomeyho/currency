class Currency {
  String code;
  num rate;
  String symbol;
  String name;

  Currency();

  bool match(String filter) {
    return name.toLowerCase().contains(filter) ||
        symbol.toLowerCase().contains(filter) ||
        code.toLowerCase().contains(filter);
  }

  Currency.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    rate = json['rate'];
    symbol = json['symbol'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'rate': rate,
        'symbol': symbol,
        'name': name,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Currency && runtimeType == other.runtimeType && code == other.code;

  @override
  int get hashCode => code.hashCode ^ rate.hashCode ^ symbol.hashCode ^ name.hashCode;
}
