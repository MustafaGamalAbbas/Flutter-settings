import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsLocalizations {
  final Locale locale;
  static const LocalizationsDelegate<SettingsLocalizations> delegate =
      _SettingsLocalizationsDelegate();
  SettingsLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static SettingsLocalizations of(BuildContext context) {
    return Localizations.of<SettingsLocalizations>(
        context, SettingsLocalizations);
  }

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedStrings[key];
  }
}

// LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an AppLocalizations object
class _SettingsLocalizationsDelegate
    extends LocalizationsDelegate<SettingsLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _SettingsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<SettingsLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    SettingsLocalizations localizations = new SettingsLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_SettingsLocalizationsDelegate old) => false;
}
