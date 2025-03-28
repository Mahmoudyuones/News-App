import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  String languaegCode = 'en';

  void changeLanguage(String language) {
    languaegCode = language;
    notifyListeners();
  }
}
