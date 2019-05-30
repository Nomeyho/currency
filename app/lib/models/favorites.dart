class Favorites {
  List<String> _codeList; // ordered
  Set<String> _codeSet;

  Favorites.empty() {
    _codeList = [];
    _codeSet = {};
  }

  Favorites(List<String> codeList) {
    _codeList = codeList;
    _codeSet = codeList.toSet();
  }

  bool contains(String code) {
    return _codeSet.contains(code);
  }

  void add(String code) {
    if (_codeSet.length >= 5) {
      if (_codeSet.contains(code)) {
        _codeSet.remove(code);
        _codeList.remove(code);
      } else {
        _codeList.removeLast();
      }
    }

    _codeList.insert(0, code);
    _codeSet.add(code);
    print('Favorite list updated: $_codeList');
  }

  List<String> toList() {
    return _codeList;
  }
}
