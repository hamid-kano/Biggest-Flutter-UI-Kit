import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/screen/BankingSignIn.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingContants.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingImages.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingStrings.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingWidget.dart';

class BankingWalkThrough extends StatefulWidget {
  static var tag = "/BankingWalkThrough";

  @override
  _BankingWalkThroughState createState() => _BankingWalkThroughState();
}

class _BankingWalkThroughState extends State<BankingWalkThrough> {
  int currentIndexPage = 0;
  int? pageLength;

  var titles = [Banking_lbl_Walk1Title, Banking_lbl_Walk2Title, Banking_lbl_Walk3Title];

  var subTitles = [Banking_lbl_Walk1SubTitle, Banking_lbl_Walk1SubTitle, Banking_lbl_Walk1SubTitle];

  @override
  void initState() {
    currentIndexPage = 0;
    pageLength = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: PageView(
              children: <Widget>[
                WalkThrough(textContent: Banking_ic_walk1),
                WalkThrough(textContent: Banking_ic_walk2),
                WalkThrough(textContent: Banking_ic_walk3),
              ],
              onPageChanged: (value) {
                setState(() {
                  currentIndexPage = value;
                });
              },
            ),
          ),
          Positioned(
            width: context.width(),
            bottom: context.height() * 0.38,
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(titles[currentIndexPage], style: boldTextStyle(size: 20, color: Banking_TextColorPrimary, fontFamily: fontBold)),
                  10.height,
                  // Adding Button
                ],
              ),
            ),
          ),
          Positioned(
            width: context.width(),
            height: 50,
            top: context.height() * 0.58,
            child: Align(
              alignment: Alignment.center,
              child: DotsIndicator(dotsCount: 3, position: currentIndexPage.toDouble(), decorator: DotsDecorator(color: Banking_view_color, activeColor: Banking_Primary)),
            ),
          ),
          Positioned(
            width: context.width(),
            top: context.height() * 0.6,
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      subTitles[currentIndexPage],
                      style: primaryTextStyle(fontFamily: fontRegular, size: 14, color: Banking_TextColorSecondary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  50.height,
                  // Adding Button
                  BankingButton(
                    textContent: Banking_lbl_Get_Started,
                    onPressed: () {
                      finish(context);
                      BankingSignIn().launch(context);
                    },
                  ),
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
    return Stack(
      children: <Widget>[
        SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
            alignment: Alignment.center,
            child: Image.asset(textContent, width: 300, height: 300),
          ),
        ),
      ],
    );
  }
}
