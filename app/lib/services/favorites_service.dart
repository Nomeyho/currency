
import 'package:app/models/favorites.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  /// list of favorite currency *codes*
  /// most recently used first
  final String _key = 'favoriteCurrencies';

  Future<Favorites> getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_key) ?? [];
    print('Retrieved favorites: $favorites');
    return Favorites(favorites);
  }

  Future<void> saveFavorites(Favorites favorites) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> list = favorites.toList();
    prefs.setStringList(_key, list);
    print('Favorites persisted: $list');
    return Favorites(list);
  }
}
