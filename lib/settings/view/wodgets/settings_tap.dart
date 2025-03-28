import 'package:flutter/material.dart';
import 'package:news/settings/view/wodgets/language_dropdown_botton.dart';
import 'package:news/shared/app_theme.dart';

class SettingsTap extends StatefulWidget {
  const SettingsTap({super.key});

  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [LanguageDropdownBotton()],
        ),
      ),
    );
  }
}
