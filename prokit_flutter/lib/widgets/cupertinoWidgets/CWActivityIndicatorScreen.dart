import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class CWActivityIndicatorScreen extends StatefulWidget {
  static String tag = '/CWActivityIndicatorScreen';

  @override
  CWActivityIndicatorScreenState createState() => CWActivityIndicatorScreenState();
}

class CWActivityIndicatorScreenState extends State<CWActivityIndicatorScreen> {
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
      appBar: AppBar(
        title: Text(
          'Cupertino Activity Indicator',
          style: boldTextStyle(color: appStore.textPrimaryColor),
        ),
      ),
      body: Center(
        child: Theme(
          data: appStore.isDarkModeOn ? ThemeData.dark() : ThemeData.light(),
          child: CupertinoActivityIndicator(
            animating: true,
            radius: 20,
          ),
        ),
      ),
    );
  }
}
