import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

import '../../../../main.dart';
import '../Colors.dart';

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
      width: context.width(),
      height: context.height(),
      child: Column(
        children: [
          Container(
            height: 75,
            width: context.width(),
            decoration: boxDecorationWithShadow(backgroundColor: appStore.scaffoldBackground!),
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Mix', style: boldTextStyle(size: 42, color: portfolio3PrimaryColor)).expand(),
                Row(
                  children: [
                    Text('HOME', style: boldTextStyle(size: 14, color: portfolio3PrimaryColor)),
                    14.width,
                    Text('ABOUT', style: boldTextStyle(size: 14)),
                    14.width,
                    Text('SERVICE', style: boldTextStyle(size: 14)),
                    14.width,
                    Text('WORK', style: boldTextStyle(size: 14)),
                    14.width,
                    Text('CONTACT', style: boldTextStyle(size: 14)),
                  ],
                )
              ],
            ).withWidth(context.width() * 0.85),
          ),
          Container(
            height: context.height() - 75,
            width: context.width(),
            child: Stack(
              children: [
                commonCachedNetworkImage(
                  p3IntoImg,
                  height: context.height() - 75,
                  width: context.width(),
                  fit: BoxFit.fitHeight,
                ),
                Container(
                  height: context.height() - 75,
                  width: context.width(),
                  color: Colors.black.withOpacity(0.5),
                ),
                Container(
                  width: context.width() * 0.85,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hello, I\'m', style: primaryTextStyle(size: 52, color: white)),
                      Text('Christopher', style: boldTextStyle(size: 65, color: white)),
                      8.height,
                      Text(
                        'UI/UX Designer',
                        style: boldTextStyle(
                          size: 22,
                          color: white,
                          decorationColor: portfolio3PrimaryColor,
                          textDecorationStyle: TextDecorationStyle.solid,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      32.height,
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text('MY WORK', style: boldTextStyle(color: Colors.white, size: 18)),
                            style: TextButton.styleFrom(
                              backgroundColor: portfolio3PrimaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                            ),
                          ),
                          16.width,
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('HIRE ME', style: boldTextStyle(color: portfolio3PrimaryColor, size: 18)),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              side: BorderSide(color: portfolio3PrimaryColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ).paddingOnly(left: 32)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
