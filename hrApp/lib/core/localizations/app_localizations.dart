import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale? locale;
  AppLocalizations({this.locale});

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationDelegate();
  late Map<String, String> _localizedStr;

  Future loadJsonLang() async {
    var jsonStr = await rootBundle.loadString(
      "assets/lang/${locale!.languageCode}.json",
    );
    Map<String, dynamic> jsonMap = json.decode(jsonStr);
    _localizedStr = jsonMap.map(
      (key, value) => MapEntry(key, value.toString()),
    );
  }

  String translate(String key) => _localizedStr[key] ?? "";
  static String t(String key) {
    // Assuming the locale is set and the instance is created
    return _instance.translate(key);
  }

  static AppLocalizations _instance = AppLocalizations();

  static void setInstance(AppLocalizations instance) {
    _instance = instance;
  }

  bool get isEnLocale => locale?.languageCode == 'en';
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale: locale);
    await appLocalizations.loadJsonLang();
    AppLocalizations.setInstance(appLocalizations);

    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

extension Translate on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}
