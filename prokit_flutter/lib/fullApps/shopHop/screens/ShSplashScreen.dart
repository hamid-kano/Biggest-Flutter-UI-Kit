import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/shopHop/screens/ShWalkThroughScreen.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShImages.dart';

class ShSplashScreen extends StatefulWidget {
  static String tag = '/ShophopSplash';

  @override
  ShSplashScreenState createState() => ShSplashScreenState();
}

class ShSplashScreenState extends State<ShSplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    finish(context);
    ShWalkThroughScreen().launch(context);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.black);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width + width * 0.4,
        child: Stack(
          children: <Widget>[
            Image.asset(splash_bg, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.cover),
            Positioned(
              top: -width * 0.2,
              left: -width * 0.2,
              child: Container(
                width: width * 0.65,
                height: width * 0.65,
                decoration: BoxDecoration(shape: BoxShape.circle, color: sh_colorPrimary.withOpacity(0.3)),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(ic_app_icon, width: width * 0.3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Shop", style: boldTextStyle(color: sh_textColorPrimary, size: 35, fontFamily: 'Bold')),
                      Text("hop", style: boldTextStyle(color: sh_colorPrimary, size: 35, fontFamily: 'Bold')),
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: -width * 0.2,
                    right: -width * 0.2,
                    child: Container(
                      width: width * 0.65,
                      height: width * 0.65,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: sh_colorPrimary.withOpacity(0.3)),
                    ),
                  ),
                ],
              ),
            ),
            Align(alignment: Alignment.bottomRight, child: Image.asset(splash_img, width: width * 0.5, height: width * 0.5))
          ],
        ),
      ),
    );
  }
}
