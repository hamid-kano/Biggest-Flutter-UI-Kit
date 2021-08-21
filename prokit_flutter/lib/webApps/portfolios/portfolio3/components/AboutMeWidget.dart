import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

import '../Colors.dart';

class AboutMeWidget extends StatefulWidget {
  static String tag = '/AboutMeWidget';

  @override
  AboutMeWidgetState createState() => AboutMeWidgetState();
}

class AboutMeWidgetState extends State<AboutMeWidget> {
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
      width: context.width() * 0.85,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 32, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          24.height,
          Text(
            'About Me',
            style: boldTextStyle(
              size: 45,
              decorationColor: portfolio3PrimaryColor,
              textDecorationStyle: TextDecorationStyle.solid,
              decoration: TextDecoration.underline,
            ),
          ),
          24.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: context.height() * 0.65,
                width: context.width(),
                child: commonCachedNetworkImage(
                  p3AboutImg,
                  width: context.width(),
                  fit: BoxFit.fitHeight,
                ).cornerRadiusWithClipRRect(5),
              ).expand(flex: 4),
              24.width,
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Why hire me for your next project?', style: boldTextStyle(size: 40)),
                    24.height,
                    Text(
                      'I love to work in User Experience & User Interface designing. Because I love to solve the design problem '
                      'and find easy and better solutions to solve it. I always try my best to make good user interface with the '
                      'best user experience. I have been working as a Visual designer from.',
                      style: secondaryTextStyle(size: 16),
                    ),
                    24.height,
                    Text(
                      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae, velit recusandae eum necessitatibus blanditiis '
                      'porro cum, facere qui impedit dolor doloribus quis reiciendis ullam repellendus.',
                      style: secondaryTextStyle(size: 16),
                    ),
                    24.height,
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        primary: Colors.transparent,
                        side: BorderSide(color: portfolio3PrimaryColor),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                      ),
                      child: Text('Download CV', style: boldTextStyle(color: portfolio3PrimaryColor, size: 18)),
                    )
                  ],
                ),
              ).expand(flex: 5)
            ],
          ),
          32.height
        ],
      ),
    );
  }
}
