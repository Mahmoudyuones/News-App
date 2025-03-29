import 'package:news/settings/data/data_source/settings_data_source.dart';
import 'package:news/settings/data/models/language.dart';

class SettingsReposatory {
  final SettingsDataSource dataSource;

  SettingsReposatory({required this.dataSource});
  void savelanguage(String languageCode) async {
    dataSource.saveLanguage(languageCode);
  }

  Future<String> getLanguage() async {
    String language = await dataSource.getLanguage();
    return language;
  }
}
