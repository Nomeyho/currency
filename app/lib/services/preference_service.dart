import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static final String langKey = 'lang';

  Future<String> getLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(langKey);
  }

  void setLang(String lang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(langKey, lang);
  }
}
