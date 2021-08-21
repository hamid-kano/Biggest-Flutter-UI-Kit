import 'dart:convert';

import 'package:flutter/material.dart';

Future<List<dynamic>?> loadDataFromJson(BuildContext context) async {
  final fakeData = await DefaultAssetBundle.of(context).loadString('assets/integrations/map_point.json');
  return json.decode(fakeData.toString());
}

String intToHex(int i) {
  var s = i.toRadixString(16);
  if (s.length == 8) {
    return '#' + s.substring(2).toUpperCase();
  } else {
    return '#' + s.toUpperCase();
  }
}

Widget networkImage(String? image, {String aPlaceholder = "images/integrations/img/placeholder.png", double? aWidth, double? aHeight, var fit = BoxFit.fill}) {
  return image != null && image.isNotEmpty
      ? FadeInImage(
          placeholder: AssetImage(aPlaceholder),
          image: NetworkImage(image),
          width: aWidth != null ? aWidth : null,
          height: aHeight != null ? aHeight : null,
          fit: fit,
        )
      : Image.asset(
          aPlaceholder,
          width: aWidth,
          height: aHeight,
          fit: BoxFit.fill,
        );
}

Widget loadingWidgetMaker() {
  return Container(
    alignment: Alignment.center,
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4,
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      child: Container(
        width: 45,
        height: 45,
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(strokeWidth: 3),
      ),
    ),
  );
}
