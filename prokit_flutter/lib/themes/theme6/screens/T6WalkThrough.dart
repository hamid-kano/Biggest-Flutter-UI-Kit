import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/dots_indicator/dots_indicator.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Colors.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Constant.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Images.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Strings.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Widget.dart';

class T6WalkThrough extends StatefulWidget {
  static String tag = '/T6WalkThrough';

  @override
  T6WalkThroughState createState() => T6WalkThroughState();
}

class T6WalkThroughState extends State<T6WalkThrough> {
  int currentIndexPage = 0;
  int? pageLength;

  var titles = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text  ",
  ];

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
    pageLength = 2;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: text("Skip", textAllCaps: true, textColor: t6colorPrimary, fontFamily: fontMedium),
              )),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PageView(
              children: <Widget>[
                WalkThrough(textContent: t6_ic_walk1, title: t6_sample_text),
                WalkThrough(textContent: t6_ic_walk2, title: t6_sample_text),
              ],
              onPageChanged: (value) {
                setState(() => currentIndexPage = value);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Align(
                  child: new DotsIndicator(
                      dotsCount: 2,
                      position: currentIndexPage,
                      decorator: DotsDecorator(
                        color: t6view_color,
                        activeColor: t6colorPrimary,
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
                T6Button(
                  textContent: t6_lbl_let_s_get_started,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class WalkThrough extends StatelessWidget {
  final String textContent;
  final String title;

  WalkThrough({Key? key, required this.textContent, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CachedNetworkImage(
              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
              imageUrl: textContent,
              height: (MediaQuery.of(context).size.height) / 2.5,
            ),
          ),
          SizedBox(
            height: h * 0.08,
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Center(
                child: Text(
              title,
              style: TextStyle(fontSize: textSizeLargeMedium, color: t6textColorSecondary),
              textAlign: TextAlign.center,
            )),
          ),
        ],
      ),
    );
  }
}
