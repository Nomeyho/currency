import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  /// list of favorite currency *codes*
  /// most recently used first
  final String favoritesKey = 'favoriteCurrencies';

  Future<List<String>> getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(favoritesKey) ?? [];
  }

  Future<List<String>> addToFavorites(String favorite) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> favorites = prefs.getStringList(favoritesKey) ?? [];

    if(favorites.contains(favorite)) {
      // reorder
      favorites.sort((f1, f2) {
        if(f1 == favorite) return -1;
        if(f2 == favorite) return 1;
        return 0;
      });
    } else {
      // remove last & insert front
      if (favorites.length >= 5) {
        favorites.removeLast();
      }
      favorites.insert(0, favorite);
      prefs.setStringList(favoritesKey, favorites);
    }

    print('Favorite list updated: ${favorites.toString()}');
    return favorites;
  }
}
