import 'package:flutter/material.dart';

class AppTheme {
  List<ProTheme>? themes;
  List<ProTheme>? screenList;
  ProTheme? dashboard;
  ProTheme? fullApp;
  ProTheme? widgets;
  ProTheme? defaultTheme;
  ProTheme? integrations;
  ProTheme? webApps;

  AppTheme({this.themes, this.screenList, this.dashboard, this.fullApp, this.widgets, this.defaultTheme, this.integrations, this.webApps});

  factory AppTheme.fromJson(Map<String, dynamic> json) {
    return AppTheme(
      themes: json['themes'] != null ? (json['themes'] as List).map((i) => ProTheme.fromJson(i)).toList() : null,
      screenList: json['screen_list'] != null ? (json['screen_list'] as List).map((i) => ProTheme.fromJson(i)).toList() : null,
      dashboard: json['dashboard'] != null ? ProTheme.fromJson(json['dashboard']) : null,
      fullApp: json['fullapp'] != null ? ProTheme.fromJson(json['fullapp']) : null,
      widgets: json['widgets'] != null ? ProTheme.fromJson(json['widgets']) : null,
      defaultTheme: json['defaultTheme'] != null ? ProTheme.fromJson(json['defaultTheme']) : null,
      integrations: json['integrations'] != null ? ProTheme.fromJson(json['integrations']) : null,
      webApps: json['webApps'] != null ? ProTheme.fromJson(json['webApps']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.themes != null) {
      data['themes'] = this.themes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProTheme {
  String? name;
  // ignore: non_constant_identifier_names
  bool? show_cover;
  // ignore: non_constant_identifier_names
  List<ProTheme>? sub_kits;
  // ignore: non_constant_identifier_names
  String? title_name;
  String? type;
  String? icon;
  // ignore: non_constant_identifier_names
  bool? is_theme;
  String? tag;
  bool? darkThemeSupported;
  Widget? widget;

  // ignore: non_constant_identifier_names
  ProTheme({this.name, this.icon, this.is_theme, this.tag, this.type, this.show_cover, this.sub_kits, this.title_name, this.darkThemeSupported, this.widget});

  factory ProTheme.fromJson(Map<String, dynamic> json) {
    return ProTheme(
      name: json['name'],
      icon: json['icon'],
      is_theme: json['is_theme'],
      tag: json['tag'],
      type: json['type'],
      show_cover: json['show_cover'],
      sub_kits: json['sub_kits'] != null ? (json['sub_kits'] as List).map((i) => ProTheme.fromJson(i)).toList() : null,
      title_name: json['title_name'],
      darkThemeSupported: json['darkThemeSupported'],
      widget: json['widget'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['show_cover'] = this.show_cover;
    data['title_name'] = this.title_name;
    data['type'] = this.type;
    data['tag'] = this.tag;
    data['darkThemeSupported'] = this.darkThemeSupported;
    data['icon'] = this.icon;
    data['widget'] = this.widget;
    data['is_theme'] = this.is_theme;
    if (this.sub_kits != null) {
      data['sub_kits'] = this.sub_kits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
