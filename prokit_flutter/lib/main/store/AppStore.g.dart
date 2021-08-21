// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on AppStoreBase, Store {
  final _$isDarkModeOnAtom = Atom(name: 'AppStoreBase.isDarkModeOn');

  @override
  bool get isDarkModeOn {
    _$isDarkModeOnAtom.reportRead();
    return super.isDarkModeOn;
  }

  @override
  set isDarkModeOn(bool value) {
    _$isDarkModeOnAtom.reportWrite(value, super.isDarkModeOn, () {
      super.isDarkModeOn = value;
    });
  }

  final _$scaffoldBackgroundAtom = Atom(name: 'AppStoreBase.scaffoldBackground');

  @override
  Color? get scaffoldBackground {
    _$scaffoldBackgroundAtom.reportRead();
    return super.scaffoldBackground;
  }

  @override
  set scaffoldBackground(Color? value) {
    _$scaffoldBackgroundAtom.reportWrite(value, super.scaffoldBackground, () {
      super.scaffoldBackground = value;
    });
  }

  final _$backgroundColorAtom = Atom(name: 'AppStoreBase.backgroundColor');

  @override
  Color? get backgroundColor {
    _$backgroundColorAtom.reportRead();
    return super.backgroundColor;
  }

  @override
  set backgroundColor(Color? value) {
    _$backgroundColorAtom.reportWrite(value, super.backgroundColor, () {
      super.backgroundColor = value;
    });
  }

  final _$backgroundSecondaryColorAtom = Atom(name: 'AppStoreBase.backgroundSecondaryColor');

  @override
  Color? get backgroundSecondaryColor {
    _$backgroundSecondaryColorAtom.reportRead();
    return super.backgroundSecondaryColor;
  }

  @override
  set backgroundSecondaryColor(Color? value) {
    _$backgroundSecondaryColorAtom.reportWrite(value, super.backgroundSecondaryColor, () {
      super.backgroundSecondaryColor = value;
    });
  }

  final _$textPrimaryColorAtom = Atom(name: 'AppStoreBase.textPrimaryColor');

  @override
  Color? get textPrimaryColor {
    _$textPrimaryColorAtom.reportRead();
    return super.textPrimaryColor;
  }

  @override
  set textPrimaryColor(Color? value) {
    _$textPrimaryColorAtom.reportWrite(value, super.textPrimaryColor, () {
      super.textPrimaryColor = value;
    });
  }

  final _$appColorPrimaryLightColorAtom = Atom(name: 'AppStoreBase.appColorPrimaryLightColor');

  @override
  Color? get appColorPrimaryLightColor {
    _$appColorPrimaryLightColorAtom.reportRead();
    return super.appColorPrimaryLightColor;
  }

  @override
  set appColorPrimaryLightColor(Color? value) {
    _$appColorPrimaryLightColorAtom.reportWrite(value, super.appColorPrimaryLightColor, () {
      super.appColorPrimaryLightColor = value;
    });
  }

  final _$textSecondaryColorAtom = Atom(name: 'AppStoreBase.textSecondaryColor');

  @override
  Color? get textSecondaryColor {
    _$textSecondaryColorAtom.reportRead();
    return super.textSecondaryColor;
  }

  @override
  set textSecondaryColor(Color? value) {
    _$textSecondaryColorAtom.reportWrite(value, super.textSecondaryColor, () {
      super.textSecondaryColor = value;
    });
  }

  final _$appBarColorAtom = Atom(name: 'AppStoreBase.appBarColor');

  @override
  Color? get appBarColor {
    _$appBarColorAtom.reportRead();
    return super.appBarColor;
  }

  @override
  set appBarColor(Color? value) {
    _$appBarColorAtom.reportWrite(value, super.appBarColor, () {
      super.appBarColor = value;
    });
  }

  final _$iconColorAtom = Atom(name: 'AppStoreBase.iconColor');

  @override
  Color? get iconColor {
    _$iconColorAtom.reportRead();
    return super.iconColor;
  }

  @override
  set iconColor(Color? value) {
    _$iconColorAtom.reportWrite(value, super.iconColor, () {
      super.iconColor = value;
    });
  }

  final _$iconSecondaryColorAtom = Atom(name: 'AppStoreBase.iconSecondaryColor');

  @override
  Color? get iconSecondaryColor {
    _$iconSecondaryColorAtom.reportRead();
    return super.iconSecondaryColor;
  }

  @override
  set iconSecondaryColor(Color? value) {
    _$iconSecondaryColorAtom.reportWrite(value, super.iconSecondaryColor, () {
      super.iconSecondaryColor = value;
    });
  }

  final _$selectedLanguageAtom = Atom(name: 'AppStoreBase.selectedLanguage');

  @override
  String get selectedLanguage {
    _$selectedLanguageAtom.reportRead();
    return super.selectedLanguage;
  }

  @override
  set selectedLanguage(String value) {
    _$selectedLanguageAtom.reportWrite(value, super.selectedLanguage, () {
      super.selectedLanguage = value;
    });
  }

  final _$selectedDrawerItemAtom = Atom(name: 'AppStoreBase.selectedDrawerItem');

  @override
  int get selectedDrawerItem {
    _$selectedDrawerItemAtom.reportRead();
    return super.selectedDrawerItem;
  }

  @override
  set selectedDrawerItem(int value) {
    _$selectedDrawerItemAtom.reportWrite(value, super.selectedDrawerItem, () {
      super.selectedDrawerItem = value;
    });
  }

  final _$toggleDarkModeAsyncAction = AsyncAction('AppStoreBase.toggleDarkMode');

  @override
  Future<void> toggleDarkMode({bool? value}) {
    return _$toggleDarkModeAsyncAction.run(() => super.toggleDarkMode(value: value));
  }

  final _$AppStoreBaseActionController = ActionController(name: 'AppStoreBase');

  @override
  void setLanguage(String aLanguage) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(name: 'AppStoreBase.setLanguage');
    try {
      return super.setLanguage(aLanguage);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDrawerItemIndex(int aIndex) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(name: 'AppStoreBase.setDrawerItemIndex');
    try {
      return super.setDrawerItemIndex(aIndex);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkModeOn: ${isDarkModeOn},
scaffoldBackground: ${scaffoldBackground},
backgroundColor: ${backgroundColor},
backgroundSecondaryColor: ${backgroundSecondaryColor},
textPrimaryColor: ${textPrimaryColor},
appColorPrimaryLightColor: ${appColorPrimaryLightColor},
textSecondaryColor: ${textSecondaryColor},
appBarColor: ${appBarColor},
iconColor: ${iconColor},
iconSecondaryColor: ${iconSecondaryColor},
selectedLanguage: ${selectedLanguage},
selectedDrawerItem: ${selectedDrawerItem}
    ''';
  }
}
