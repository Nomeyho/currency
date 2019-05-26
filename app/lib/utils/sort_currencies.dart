
import 'package:app/models/currency.dart';

sortCurrencies(List<Currency> currencies, List<String> favorites) {
  currencies.sort((c1, c2) {

    if(favorites.contains(c1.code) && favorites.contains(c2.code)) {
      if(favorites.indexOf(c1.code) < favorites.indexOf(c2.code)) {
        return -1;
      } else {
        return 1;
      }
    }

    if(favorites.contains(c1.code)) {
      return -1;
    } else if(favorites.contains(c2.code)) {
      return 1;
    } else {
      return 0;
    }
  });
}