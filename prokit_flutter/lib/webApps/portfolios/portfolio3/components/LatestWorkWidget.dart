import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/DataGenerator.dart';

import '../Colors.dart';

class LatestWorkWidget extends StatefulWidget {
  static String tag = '/LatestWorkWidget';

  @override
  LatestWorkWidgetState createState() => LatestWorkWidgetState();
}

class LatestWorkWidgetState extends State<LatestWorkWidget> {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          32.height,
          Text(
            'Latest Works',
            style: boldTextStyle(
              size: 45,
              decorationColor: portfolio3PrimaryColor,
              textDecorationStyle: TextDecorationStyle.solid,
              decoration: TextDecoration.underline,
            ),
          ),
          24.height,
          Wrap(
            spacing: 5,
            runSpacing: 0,
            children: getLatestWorkList().map((e) {
              return Container(
                width: context.width() * 0.25,
                height: 280,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                child: Stack(
                  children: [
                    commonCachedNetworkImage(e.img!, fit: BoxFit.cover, width: context.width() * 0.25, height: 280).cornerRadiusWithClipRRect(5),
                    Container(
                      width: context.width() * 0.25,
                      height: 280,
                      alignment: Alignment.center,
                      decoration: boxDecorationRoundedWithShadow(5, backgroundColor: Colors.black.withOpacity(0.6)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Work Title Here', style: boldTextStyle(size: 24, color: white)),
                          8.height,
                          Text('Design', style: boldTextStyle(size: 16, color: white)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
          16.height,
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text('Follow me on Instagram', style: boldTextStyle(color: Colors.white, size: 18)),
              style: TextButton.styleFrom(
                backgroundColor: portfolio3PrimaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                padding: EdgeInsets.all(24),
                primary: Colors.black,
              ),
            ),
          ),
          50.height,
        ],
      ).paddingLeft(32),
    );
  }
}
