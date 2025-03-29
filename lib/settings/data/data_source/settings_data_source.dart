abstract class SettingsDataSource {
  void saveLanguage(String language);
  Future<String> getLanguage();
}
