import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Strings.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Widget.dart';

import '../../../main.dart';

class T1Search extends StatefulWidget {
  static var tag = "/T1Search";

  @override
  T1SearchState createState() => T1SearchState();
}

class T1SearchState extends State<T1Search> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(context, t1_lbl_search),
        body: Observer(
          builder: (_) => Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  decoration: boxDecoration(bgColor: appStore.scaffoldBackground, radius: 10, showShadow: true),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    autofocus: true,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: appStore.scaffoldBackground,
                      hintText: t1_lbl_search,
                      hintStyle: primaryTextStyle(),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: appStore.iconColor),
                      contentPadding: EdgeInsets.only(left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              Expanded(child: Container(child: ring(t1_lbl_welcome_to_search_bar))),
            ],
          ),
        ));
  }
}
