import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

import '../Colors.dart';

class FunFactsWidget extends StatefulWidget {
  static String tag = '/FunFactsWidget';

  @override
  FunFactsWidgetState createState() => FunFactsWidgetState();
}

class FunFactsWidgetState extends State<FunFactsWidget> {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          32.height,
          Text(
            'Fun Facts',
            style: boldTextStyle(
              size: 45,
              decorationColor: portfolio3PrimaryColor,
              textDecorationStyle: TextDecorationStyle.solid,
              decoration: TextDecoration.underline,
            ),
          ),
          24.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: context.width() * 0.2,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(16),
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: appStore.isDarkModeOn ? cardBackgroundBlackDark : portfolio3BackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.list_outlined, size: 30, color: Colors.grey),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        24.height,
                        Text('9K+', style: boldTextStyle(size: 50, color: portfolio3PrimaryColor), maxLines: 1),
                        4.height,
                        Text('Project Done', style: boldTextStyle(size: 16), textAlign: TextAlign.center),
                        24.height,
                      ],
                    ).center()
                  ],
                ),
              ).expand(),
              Container(
                width: context.width() * 0.2,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(16),
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: appStore.isDarkModeOn ? cardBackgroundBlackDark : portfolio3BackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.supervised_user_circle_outlined, size: 30, color: Colors.grey),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        24.height,
                        Text('250+', style: boldTextStyle(size: 50, color: portfolio3PrimaryColor), maxLines: 1),
                        4.height,
                        Text('Satisfied Clients', style: boldTextStyle(size: 16), textAlign: TextAlign.center),
                        24.height,
                      ],
                    ).center()
                  ],
                ),
              ).expand(),
              Container(
                width: context.width() * 0.2,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(16),
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: appStore.isDarkModeOn ? cardBackgroundBlackDark : portfolio3BackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.emoji_events_outlined, size: 30, color: Colors.grey),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        24.height,
                        Text('115', style: boldTextStyle(size: 50, color: portfolio3PrimaryColor), maxLines: 1),
                        4.height,
                        Text('Awards Own', style: boldTextStyle(size: 16), textAlign: TextAlign.center),
                        24.height,
                      ],
                    ).center()
                  ],
                ),
              ).expand(),
              Container(
                width: context.width() * 0.2,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(16),
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: appStore.isDarkModeOn ? cardBackgroundBlackDark : portfolio3BackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.emoji_emotions_outlined, size: 30, color: Colors.grey),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        24.height,
                        Text('18K+', style: boldTextStyle(size: 50, color: portfolio3PrimaryColor), maxLines: 1),
                        4.height,
                        Text('Happy Smiles', style: boldTextStyle(size: 16), textAlign: TextAlign.center),
                        24.height,
                      ],
                    ).center()
                  ],
                ),
              ).expand(),
            ],
          ),
        ],
      ).withWidth(context.width() * 0.85),
    );
  }
}
