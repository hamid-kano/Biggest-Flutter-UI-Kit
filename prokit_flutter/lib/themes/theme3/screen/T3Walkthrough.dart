import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/dots_indicator/dots_indicator.dart';
import 'package:prokit_flutter/themes/theme3/utils/T3Images.dart';
import 'package:prokit_flutter/themes/theme3/utils/colors.dart';

class T3WalkThrough extends StatefulWidget {
  static var tag = "/T3WalkThrough";

  @override
  T3WalkThroughState createState() => T3WalkThroughState();
}

class T3WalkThroughState extends State<T3WalkThrough> {
  int currentIndexPage = 0;
  int? pageLength;
  var titles = ["Sign in / Sign Up", "Choose Your Favourite Chef", "Make Delicious Dishes"];
  var subTitles = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text  ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text"
  ];

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
    pageLength = 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PageView(
              children: <Widget>[
                WalkThrough(textContent: t3_ic_walk1),
                WalkThrough(textContent: t3_ic_walk2),
                WalkThrough(textContent: t3_ic_walk3),
              ],
              onPageChanged: (value) {
                setState(() => currentIndexPage = value);
              },
            ),
          ),
          Container(
            child: Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height * 0.43,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: DotsIndicator(
                        dotsCount: 3,
                        position: currentIndexPage,
                        decorator: DotsDecorator(
                          color: t3_view_color,
                          activeColor: t3_colorPrimary,
                        )),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(titles[currentIndexPage], style: boldTextStyle(size: 20, color: t3_colorPrimary)),
                        SizedBox(height: 16),
                        Center(
                            child: Text(
                          subTitles[currentIndexPage],
                          style: secondaryTextStyle(size: 18),
                          textAlign: TextAlign.center,
                        )),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          textStyle: TextStyle(color: t3_white),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0), topLeft: Radius.circular(80.0))),
                          padding: EdgeInsets.all(0.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[t3_colorPrimary, t3_colorPrimaryDark]),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0), topLeft: Radius.circular(80.0)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text("Skip", style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
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
      alignment: Alignment.topCenter,
      child: CachedNetworkImage(
        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: textContent,
        width: 280,
        height: (MediaQuery.of(context).size.height) / 2.3,
      ),
    );
  }
}
