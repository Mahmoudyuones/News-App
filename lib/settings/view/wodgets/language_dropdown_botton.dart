import 'package:flutter/material.dart';
import 'package:news/settings/data/models/language.dart';
import 'package:news/settings/data/view_model/settings_provider.dart';
import 'package:news/shared/app_theme.dart';
import 'package:provider/provider.dart';

class LanguageDropdownBotton extends StatefulWidget {
  const LanguageDropdownBotton({
    super.key,
  });
  @override
  State<LanguageDropdownBotton> createState() => _LanguageDropdownBottonState();
}

class _LanguageDropdownBottonState extends State<LanguageDropdownBotton> {
  List<Language> languages = [
    Language(languageName: 'عربى', code: 'ar'),
    Language(languageName: 'English', code: 'en')
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: MediaQuery.of(context).size.width * .8,
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primary, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Language>(
          value: languages
              .firstWhere((e) => e.code == settingsProvider.languaegCode),
          dropdownColor: AppTheme.white,
          borderRadius: BorderRadius.circular(15),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
          style: TextTheme.of(context).titleSmall,
          onChanged: (selected) {
            if (selected != null) {
              settingsProvider.changeLanguage(selected.code);
              settingsProvider.saveLanguage(selected.code);
              setState(() {});
            }
          },
          items: languages
              .map((language) => DropdownMenuItem<Language>(
                    value: language,
                    child: Text(language.languageName),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
