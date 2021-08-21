import 'package:flutter/material.dart';

class MuviAppState with ChangeNotifier {
  Locale locale = Locale('en');
  var selectedLanguageCode = 'en';
  var wishListCount = 0;

  bool isDarkTheme = false;

  set setThemeData(bool val) {
    if (val) {
      isDarkTheme = true;
    } else {
      isDarkTheme = false;
    }
    notifyListeners();
  }

  MuviAppState(lang, {isDarkMode = false}) {
    selectedLanguageCode = lang;
    isDarkTheme = isDarkMode;
  }

  Locale get getLocale => locale;

  get getSelectedLanguageCode => selectedLanguageCode;

  get getWishListCount => wishListCount;

  setLocale(locale) => this.locale = locale;

  setSelectedLanguageCode(code) => this.selectedLanguageCode = code;

  changeLocale(Locale l) {
    locale = l;
    notifyListeners();
  }

  changeMode(isDarkMode) {
    isDarkTheme = isDarkMode;
    notifyListeners();
  }

  changeLanguageCode(code) {
    selectedLanguageCode = code;
    notifyListeners();
  }

  changeWishListCount(count) {
    wishListCount = count;
    notifyListeners();
  }
}
