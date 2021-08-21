import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/DataGenerator.dart';

import '../../../../main.dart';

class GuideLineWidget extends StatefulWidget {
  static String tag = '/GuideLineScreen';

  @override
  GuideLineWidgetState createState() => GuideLineWidgetState();
}

class GuideLineWidgetState extends State<GuideLineWidget> {
  List<Widget> pages = [];
  var controller = PageController();
  var selectedIndex = 0;

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
    List<Widget> getPages() {
      pages = [
        Container(
          width: context.width(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getGuideLineDetail1().map((e) {
              return Container(
                width: context.width() * 0.20,
                decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor!),
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    commonCachedNetworkImage(e.img!, height: 60, width: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                    16.height,
                    Text(e.name!, style: primaryTextStyle(color: Colors.green, size: 20)),
                    16.height,
                    Text(e.detail!, style: secondaryTextStyle(size: 14)).expand(),
                    16.height,
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        Container(
          width: context.width(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getGuideLineDetail1().map((e) {
              return Container(
                width: context.width() * 0.20,
                decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor!),
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    commonCachedNetworkImage(e.img!, height: 60, width: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                    16.height,
                    Text(e.name!, style: primaryTextStyle(color: Colors.green, size: 20)),
                    16.height,
                    Text(e.detail!, style: secondaryTextStyle(size: 14)).expand(),
                    16.height,
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ];
      return pages;
    }

    return Container(
      width: context.width(),
      height: context.height(),
      child: Column(
        children: [
          40.height,
          Text('What They Says', style: primaryTextStyle(size: 36)),
          16.height,
          Text(
            'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere '
            'cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus '
            'turpis sodales quis. Integer sit amet mattis quam.',
            style: secondaryTextStyle(),
            textAlign: TextAlign.center,
          ).withWidth(context.width() * 0.5),
          50.height,
          Container(
            height: 300,
            width: context.width(),
            child: PageView(
              controller: controller,
              children: getPages(),
              onPageChanged: (index) {
                selectedIndex = index;
                setState(() {});
              },
            ),
          ),
          40.height,
          AnimatedContainer(
            duration: Duration(seconds: 1),
            child: DotIndicator(
              pages: pages,
              pageController: controller,
              indicatorColor: Colors.green,
              onDotTap: (i) {
                selectedIndex = i;
                controller.animateToPage(i, duration: Duration(milliseconds: 500), curve: Curves.linear);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
