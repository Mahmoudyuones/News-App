import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  String languaegCode = 'en';
  SettingsProvider() {
    getLanguage();
  }
  void changeLanguage(String language) {
    if (language == languaegCode) return;
    languaegCode = language;
    saveLanguage(language);
    notifyListeners();
  }

  void saveLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (language == 'en') {
      prefs.setString('language', 'en');
    } else {
      prefs.setString('language', 'ar');
    }
  }

  void getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('language') ?? 'en';
    if (lang == 'en') {
      languaegCode = 'en';
    } else {
      languaegCode = 'ar';
    }
    notifyListeners();
  }
}
