import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodColors.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodImages.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodString.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/dots_indicator/dots_indicator.dart';

import 'FoodSignIn.dart';

class FoodWalkThrough extends StatefulWidget {
  static String tag = '/FoodWalkThrough';

  @override
  FoodWalkThroughState createState() => FoodWalkThroughState();
}

class FoodWalkThroughState extends State<FoodWalkThrough> {
  PageController pageController = PageController();

  int currentIndexPage = 0;
  int? pageLength;
  var titles = ["Discover place near you", "Most Delicious Dishes!", "Just make an order!"];
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
    changeStatusColor(food_colorPrimary_light);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PageView(
              controller: pageController,
              children: <Widget>[
                WalkThrough(textContent: food_ic_walk1),
                WalkThrough(textContent: food_ic_walk2),
                WalkThrough(textContent: food_ic_walk3),
              ],
              onPageChanged: (value) {
                setState(() => currentIndexPage = value);
              },
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(titles[currentIndexPage], style: boldTextStyle(size: 20, color: food_textColorPrimary)),
                  SizedBox(height: 10),
                  Center(
                    child: Text(subTitles[currentIndexPage], style: secondaryTextStyle(size: 16, color: food_textColorSecondary), textAlign: TextAlign.center),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Text(food_lbl_skip, style: secondaryTextStyle(size: 16)),
                        onTap: () {
                          FoodSignIn().launch(context);
                        },
                      ),
                      DotsIndicator(dotsCount: 3, position: currentIndexPage, decorator: DotsDecorator(color: food_view_color, activeColor: food_colorPrimary)),
                      InkWell(
                        child: Padding(child: Text(food_lbl_next, style: primaryTextStyle(color: food_colorPrimary)), padding: EdgeInsets.all(8)),
                        onTap: () {
                          currentIndexPage = currentIndexPage + 1;
                          if (currentIndexPage >= 3) {
                            currentIndexPage = 0;
                            FoodSignIn().launch(context);
                          } else {
                            pageController.animateToPage(currentIndexPage, duration: Duration(milliseconds: 500), curve: Curves.ease);
                            setState(() {});
                          }
                        },
                      ),
                    ],
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
      height: MediaQuery.of(context).size.height,
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            Arc(
              arcType: ArcType.CONVEX,
              edge: Edge.BOTTOM,
              height: (MediaQuery.of(context).size.width) / 20,
              child: Container(height: (MediaQuery.of(context).size.height) / 1.7, width: MediaQuery.of(context).size.width, color: food_colorPrimary_light),
            ),
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) / 1.7,
                alignment: Alignment.center,
                child: SvgPicture.asset(textContent, width: 300, height: (MediaQuery.of(context).size.height) / 2.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
