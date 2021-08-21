import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/webApps/portfolios/portfolio2/components/AvailableProjectWidget.dart';
import 'package:prokit_flutter/webApps/portfolios/portfolio2/components/GalleryWidget.dart';
import 'package:prokit_flutter/webApps/portfolios/portfolio2/components/IndeedWidget.dart';
import 'package:prokit_flutter/webApps/portfolios/portfolio2/components/ProjectDetailWidget.dart';

import 'components/AboutUsScreen.dart';
import 'components/IntroductionScreen.dart';
import 'components/ServicesScreen.dart';
import 'components/TestimonialWidget.dart';

class Portfolio2Screen extends StatefulWidget {
  static String tag = '/Portfolio2Screen';

  @override
  Portfolio2ScreenState createState() => Portfolio2ScreenState();
}

class Portfolio2ScreenState extends State<Portfolio2Screen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Portfolio 2'),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              IntroductionScreen(),
              AboutUsScreen(),
              ServicesScreen(),
              GalleryWidget(),
              ProjectDetailWidget(),
              TestimonialWidget(),
              AvailableProjectWidget(),
              IndeedWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
