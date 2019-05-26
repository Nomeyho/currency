class Currency {
  String code;
  num rate;
  String symbol;
  String name;
  /// transient
  bool isFavorite;

  Currency();

  bool match(String filter) {
    if (filter == null || filter.length == 0) {
      return true;
    }

    return name.toLowerCase().contains(filter) ||
          symbol.toLowerCase().contains(filter) ||
          code.toLowerCase().contains(filter);
  }

  Currency setIsFavorite(bool isFavorite) {
    this.isFavorite = isFavorite;
    return this;
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
      identical(this, other) ||
      other is Currency &&
          runtimeType == other.runtimeType &&
          code == other.code;

  @override
  int get hashCode =>
      code.hashCode ^ rate.hashCode ^ symbol.hashCode ^ name.hashCode;
}
