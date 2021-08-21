import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/dots_indicator/dots_indicator.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Images.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Strings.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Widgets.dart';

import '../../../main.dart';

class T2WalkThrough extends StatefulWidget {
  static var tag = "/T2WalkThrough";

  @override
  T2WalkThroughState createState() => T2WalkThroughState();
}

class T2WalkThroughState extends State<T2WalkThrough> {
  int currentIndexPage = 0;
  int? pageLength;

  var titles = ["All important tips", "Meditation is usefull for health", "Jogging is good for health"];

  var subTitles = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text  ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text"
  ];

  @override
  void initState() {
    currentIndexPage = 0;
    pageLength = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);

    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: PageView(
                children: <Widget>[
                  WalkThrough(textContent: t2_walk_1),
                  WalkThrough(textContent: t2_walk_2),
                  WalkThrough(textContent: t2_walk_3),
                ],
                onPageChanged: (value) {
                  setState(() => currentIndexPage = value);
                },
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: 50,
              top: MediaQuery.of(context).size.height * 0.58,
              child: Align(
                alignment: Alignment.center,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: currentIndexPage,
                  decorator: DotsDecorator(color: t2_view_color, activeColor: t2_colorPrimary),
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height * 0.6,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(titles[currentIndexPage], style: boldTextStyle(size: 20, color: appStore.textPrimaryColor)),
                    SizedBox(height: 10),
                    Center(child: Text(subTitles[currentIndexPage], style: primaryTextStyle(size: 18, color: t2_textColorSecondary), textAlign: TextAlign.center)),
                    //SizedBox(height: 50),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: t2AppButton(
                  textContent: t2_lbl_get_started,
                  onPressed: () {
                    changeStatusColor(t2White);
                  },
                ),
              ),
            ),
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: appStore.iconColor,
                      ),
                      onPressed: () {
                        finish(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Center(
                        child: Text(
                          t2_lbl_walkthrough,
                          maxLines: 2,
                          style: boldTextStyle(size: 22, color: appStore.textPrimaryColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String textContent;

  WalkThrough({Key? key, required this.textContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            Image.asset(t2_walk_bg, fit: BoxFit.fill, width: MediaQuery.of(context).size.width, height: (MediaQuery.of(context).size.height) / 1.7),
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) / 1.7,
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                  imageUrl: textContent,
                  width: 300,
                  height: (MediaQuery.of(context).size.height) / 2.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
