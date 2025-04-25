import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(Locale initialLocale) : super(SelectedLocale(initialLocale));

  void toArabic() => emit(const SelectedLocale(Locale('ar')));
  void toEnglish() => emit(const SelectedLocale(Locale('en')));

  static Future<LocaleCubit> create() async {
    //var prefManager = PreferenceManager();
    // final savedLang =
    //     await prefManager.readFromSecureStorage(KeysCatalog.preferedLang);
    // var code = savedLang == LanguageIso.en.value ? 'en' : 'ar';
    // final initialLocale = const Locale('ar');
    return LocaleCubit(const Locale('en', 'US'));
  }
}
