import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/main/screens/ProKitScreenListing.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    ProKitScreenListing.tag: (context) => ProKitScreenListing(ProTheme()),
  };
}
