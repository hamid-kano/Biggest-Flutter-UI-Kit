import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Colors.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Constant.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Images.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Strings.dart';

import '../../../main.dart';

class T13WalkThroughScreen extends StatefulWidget {
  static String tag = '/T13WalkThroughScreen';

  @override
  T13WalkThroughScreenState createState() => T13WalkThroughScreenState();
}

class T13WalkThroughScreenState extends State<T13WalkThroughScreen> {
  int currentIndexPage = 0;
  int? pageLength;

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
    pageLength = 3;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 100,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: currentIndexPage.toDouble(),
                  decorator: DotsDecorator(
                    size: Size.square(6.0),
                    activeSize: Size.square(10.0),
                    color: t13_view_color,
                    activeColor: t13_colorPrimary,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PageView(
              children: <Widget>[
                WalkThrough(textContent: t13_ic_walk1, title: t13_lbl_simple_text),
                WalkThrough(textContent: t13_ic_walk2, title: t13_lbl_simple_text),
                WalkThrough(textContent: t13_ic_walk3, title: t13_lbl_simple_text),
              ],
              onPageChanged: (value) {
                setState(() => currentIndexPage = value);
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[t13_colorPrimary, t13_color_gradient1]),
              ),
              padding: EdgeInsets.all(16.0),
              child: text(t13_lbl_get_started, textColor: t13_white, fontFamily: fontMedium, isCentered: true),
            ).onTap(() {
              finish(context);
            }),
          ),
        ],
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String textContent;
  final String title;

  WalkThrough({Key? key, required this.textContent, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          commonCacheImageWidget(textContent, context.height() * 0.5, width: w, fit: BoxFit.cover),
          SizedBox(height: h * 0.05),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: <Widget>[
                text("Welcome", textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal),
                SizedBox(height: 8),
                text(title, textColor: appStore.textSecondaryColor, fontSize: textSizeLargeMedium, isCentered: true, maxLine: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
