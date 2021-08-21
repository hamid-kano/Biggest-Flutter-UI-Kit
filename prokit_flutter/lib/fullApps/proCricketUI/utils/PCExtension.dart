import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCPlayerListModel.dart';

Future<String> loadContentAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<List<PCPlayerListModel>> loadPlayerList() async {
  String jsonString = await loadContentAsset('assets/cricket_data/Cricket_Team.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => PCPlayerListModel.fromJson(i)).toList();
}
