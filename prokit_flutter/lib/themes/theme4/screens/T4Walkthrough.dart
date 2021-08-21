import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/dots_indicator/dots_indicator.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Colors.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Constant.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Images.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Strings.dart';
import 'package:prokit_flutter/themes/theme4/utils/widgets/T4Button.dart';

import '../../../main.dart';

class T4WalkThrough extends StatefulWidget {
  static var tag = "/T4WalkThrough";

  @override
  T4WalkThroughState createState() => T4WalkThroughState();
}

class T4WalkThroughState extends State<T4WalkThrough> {
  int currentIndexPage = 0;

  PageController _controller = new PageController();

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
  }

  VoidCallback? onPrev() {
    setState(() {
      if (currentIndexPage >= 1) {
        currentIndexPage = currentIndexPage - 1;
        _controller.jumpToPage(currentIndexPage);
      }
    });
  }

 VoidCallback? onNext() {
    setState(() {
      if (currentIndexPage < 2) {
        currentIndexPage = currentIndexPage + 1;
        _controller.jumpToPage(currentIndexPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(t4_walk_bg, width: width * 0.8, height: height * 0.5, fit: BoxFit.fill),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PageView(
              controller: _controller,
              children: <Widget>[
                WalkThrough(textContent: latest_news_daily, walkImg: t4_walk1),
                WalkThrough(textContent: regularNotifications, walkImg: t4_walk2),
                WalkThrough(textContent: awardWinningApp, walkImg: t4_walk3),
              ],
              onPageChanged: (value) {
                setState(() => currentIndexPage = value);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(child: T4Button(textContent: "Prev", onPressed: onPrev)),
                  DotsIndicator(
                      dotsCount: 3,
                      position: currentIndexPage,
                      decorator: DotsDecorator(
                        color: t4_view_color,
                        activeColor: t4_colorPrimary,
                      )),
                  T4Button(
                    textContent: "Next",
                    onPressed: onNext,
                    isStroked: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String? textContent;
  final String? walkImg;

  WalkThrough({Key? key, this.textContent, this.walkImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: h * 0.05),
            height: h * 0.5,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: walkImg!, width: width * 0.8, height: h * 0.4),
              ],
            ),
          ),
          SizedBox(height: h * 0.08),
          text(textContent, textColor: appStore.textPrimaryColor, fontSize: textSizeNormal, fontFamily: fontMedium),
          Padding(
            padding: EdgeInsets.only(left: 28.0, right: 28.0),
            child: text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.simply duumy text ", fontSize: textSizeMedium, maxLine: 3, isCentered: true),
          )
        ],
      ),
    );
  }
}
