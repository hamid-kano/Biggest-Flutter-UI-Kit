import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';

class CWSwitchScreen extends StatefulWidget {
  static String tag = '/CWSwitchScreen';

  @override
  CWSwitchScreenState createState() => CWSwitchScreenState();
}

class CWSwitchScreenState extends State<CWSwitchScreen> {
  bool isDefault = true;
  bool isTrackColorSwitch = false;
  bool isActiveColorSwitch = true;
  bool isDragColorSwitch = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Cupertino Switch'),
      body: SafeArea(
          child: Column(
        children: [
          Card(
              color: appStore.appBarColor,
              margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
              elevation: 2.0,
              shadowColor: Colors.black,
              child: ListTile(
                  title: Text(
                    'Default Switch',
                    style: primaryTextStyle(),
                  ),
                  trailing: CupertinoSwitch(
                    value: isDefault,
                    onChanged: (bool val) {
                      isDefault = val;
                      setState(() {});
                    },
                  ))),
          Card(
              color: appStore.appBarColor,
              margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
              elevation: 2.0,
              shadowColor: Colors.black,
              child: ListTile(
                  title: Text(
                    'Switch with track & active color',
                    style: primaryTextStyle(),
                  ),
                  trailing: CupertinoSwitch(
                    value: isTrackColorSwitch,
                    trackColor: getColorFromHex('#8998FF'),
                    activeColor: getColorFromHex('#f2866c'),
                    onChanged: (bool val) {
                      isTrackColorSwitch = val;
                      setState(() {});
                    },
                  ))),
          Card(
              color: appStore.appBarColor,
              margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
              elevation: 2.0,
              shadowColor: Colors.black,
              child: ListTile(
                  title: Text(
                    'Switch with active color',
                    style: primaryTextStyle(),
                  ),
                  trailing: CupertinoSwitch(
                    value: isActiveColorSwitch,
                    activeColor: getColorFromHex('#f2866c'),
                    onChanged: (bool val) {
                      isActiveColorSwitch = val;
                      setState(() {});
                    },
                  ))),
        ],
      )),
    );
  }
}
