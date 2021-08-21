import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';

class CWSliderScreen extends StatefulWidget {
  static String tag = '/CWSliderScreen';

  @override
  CWSliderScreenState createState() => CWSliderScreenState();
}

class CWSliderScreenState extends State<CWSliderScreen> {
  double progressValue = 10.0;
  double divisionsProgressValue = 40.0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Cupertino Slider'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.height,
            Text(
              "Default Slider",
              style: primaryTextStyle(),
            ).paddingOnly(top: 12, left: 12, right: 12),
            Card(
                color: appStore.appBarColor,
                margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
                elevation: 2.0,
                shadowColor: Colors.black,
                child: ListTile(
                    title: CupertinoSlider(
                      min: 0.0,
                      max: 100.0,
                      value: progressValue,
                      activeColor: appStore.textPrimaryColor,
                      onChanged: (val) {
                        progressValue = val;
                        setState(() {});
                      },
                    ),
                    trailing: Text(
                      "Value =  ${progressValue.toInt()}",
                      style: primaryTextStyle(),
                    ))),
            Text(
              "Discrete Slider",
              style: primaryTextStyle(),
            ).paddingOnly(top: 12, left: 12, right: 12),
            Card(
                color: appStore.appBarColor,
                margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
                elevation: 2.0,
                shadowColor: Colors.black,
                child: ListTile(
                    title: CupertinoSlider(
                      min: 0.0,
                      max: 100.0,
                      divisions: 10,
                      thumbColor: getColorFromHex('#8998FF'),
                      activeColor: appStore.textPrimaryColor,
                      value: divisionsProgressValue,
                      onChanged: (val) {
                        divisionsProgressValue = val;
                        setState(() {});
                      },
                    ),
                    trailing: Text(
                      "Value =  ${divisionsProgressValue.toInt()}",
                      style: primaryTextStyle(),
                    ))),
          ],
        ),
      ),
    );
  }
}
