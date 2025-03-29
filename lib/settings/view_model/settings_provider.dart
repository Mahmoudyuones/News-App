import 'package:flutter/material.dart';
import 'package:news/settings/data/reposatory.dart/settings_reposatory.dart';
import 'package:news/shared/server_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  String languaegCode = 'en';
  late final SettingsReposatory reposatory;

  SettingsProvider() {
    reposatory =
        SettingsReposatory(dataSource: ServerLocator.settingsDataSource);
    getLanguage();
  }

  Future<void> getLanguage() async {
    languaegCode = await reposatory.getLanguage();
    notifyListeners();
  }

  void saveLanguage(String languae) async {
    reposatory.savelanguage(languae);
  }

  void changeLanguage(String language) {
    if (language == languaegCode) return;
    languaegCode = language;
    notifyListeners();
  }
}
