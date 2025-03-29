import 'package:news/settings/data/data_source/settings_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsDataSourecSharedPrefrenses extends SettingsDataSource {
  @override
  void saveLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (language == 'en') {
      prefs.setString('language', 'en');
    } else {
      prefs.setString('language', 'ar');
    }
  }

  @override
  Future<String> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('language') ?? 'en';
    if (lang == 'en') {
      return 'en';
    } else {
      return 'ar';
    }
  }
}
