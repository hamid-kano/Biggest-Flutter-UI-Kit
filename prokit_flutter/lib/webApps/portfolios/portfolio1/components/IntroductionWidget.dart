import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

class IntroductionWidget extends StatefulWidget {
  static String tag = '/IntroductionScreen';

  @override
  IntroductionWidgetState createState() => IntroductionWidgetState();
}

class IntroductionWidgetState extends State<IntroductionWidget> {
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
      height: context.height(),
      width: context.width(),
      child: Stack(
        children: [
          commonCachedNetworkImage(p1IntoImg, height: context.height(), width: context.width(), fit: BoxFit.cover),
          /*Container(
            height: context.height(),
            width: context.width(),
            color: Colors.black12.withOpacity(0.6),
          ),*/
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('My WebSite', style: boldTextStyle(size: 36, color: Colors.white)).expand(),
                  Row(
                    children: [
                      Text('Home', style: boldTextStyle(size: 16, color: Colors.white)),
                      20.width,
                      Text('About', style: boldTextStyle(size: 16, color: Colors.white)),
                      20.width,
                      Text('Service', style: boldTextStyle(size: 16, color: Colors.white)),
                      20.width,
                      Text('Contact', style: boldTextStyle(size: 16, color: Colors.white)),
                    ],
                  )
                ],
              ).paddingOnly(top: 32, left: 32, right: 32),
              70.height,
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      padding: EdgeInsets.all(6),
                      color: white,
                      child: commonCachedNetworkImage(p2User, height: 180, width: 180, fit: BoxFit.cover).cornerRadiusWithClipRRect(90),
                    ).cornerRadiusWithClipRRect(90),
                    32.height,
                    Text('Hello, I\'m John Doe', style: boldTextStyle(size: 56, color: Colors.white)),
                    16.height,
                    Text('Photographer', style: boldTextStyle(size: 24, color: Colors.white)),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
