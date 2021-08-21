import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/portfolio2/components/SnowWidget.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

class IntroductionScreen extends StatefulWidget {
  static String tag = '/IntroductionScreen';

  @override
  IntroductionScreenState createState() => IntroductionScreenState();
}

class IntroductionScreenState extends State<IntroductionScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: context.height(),
      width: context.width(),
      child: Stack(
        children: [
          Positioned(
            height: context.height(),
            child: commonCachedNetworkImage(p2IntoImg, fit: BoxFit.fitHeight),
            right: 0,
          ),
          Row(
            children: [
              Row(
                children: [
                  /*Icon(Icons.home),*/
                  Image.asset('images/app/app_icon.png', height: 70),
                  16.width,
                  // Text('Portfolio 2', style: boldTextStyle(size: 16, color: portfolio2PrimaryColor)),
                ],
              ).expand(),
              Text('Home', style: boldTextStyle(size: 16, color: Colors.white)),
              16.width,
              Text('About', style: boldTextStyle(size: 16, color: Colors.white)),
              16.width,
              Text('Services', style: boldTextStyle(size: 16, color: Colors.white)),
              16.width,
              Text('Contact', style: boldTextStyle(size: 16, color: Colors.white)),
              16.width,
            ],
          ).paddingAll(16),
          Container(
            width: context.width() * 0.5,
            margin: EdgeInsets.only(left: context.width() * 0.2),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hello, I’m John Doe', style: boldTextStyle(size: 34, color: Colors.white, letterSpacing: 1.2)),
                  16.height,
                  Text(
                    'I love to work in User Experience & User Interface designing. Because I love to solve the design problem and find '
                    'easy and better solutions to solve it. I always try my best to make good user interface with the best user experience.',
                    style: primaryTextStyle(size: 16, color: Colors.white, letterSpacing: 1.3),
                  ),
                  30.height,
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                          primary: Colors.white,
                        ),
                        child: Text('My Work', style: boldTextStyle(color: Colors.black)),
                      ),
                      16.width,
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                        ),
                        child: Text('Hire Me', style: boldTextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: SnowWidget(isRunning: true, totalSnow: 150, speed: 0.2),
            width: context.width(),
            height: context.height(),
          ),
        ],
      ),
    );
  }
}
