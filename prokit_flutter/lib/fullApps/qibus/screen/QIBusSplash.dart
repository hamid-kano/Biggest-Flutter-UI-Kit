import 'dart:async';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';

import 'QIBusSignIn.dart';

class QIBusSplash extends StatefulWidget {
  static String tag = '/QIBusSplash';

  @override
  QIBusSplashState createState() => QIBusSplashState();
}

class QIBusSplashState extends State<QIBusSplash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    QIBusSignIn().launch(context);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image(
            image: AssetImage(qibus_ic_logo),
            width: width * 0.3,
            height: width * 0.3,
          ),
        ),
      ),
    );
  }
}
