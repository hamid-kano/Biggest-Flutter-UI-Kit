import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSignInAndSignUpScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPTabBarSignInScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPImages.dart';

class MPWalkThroughScreen extends StatefulWidget {
  static String tag = '/MPWalkThroughScreen';

  @override
  MPWalkThroughScreenState createState() => MPWalkThroughScreenState();
}

class MPWalkThroughScreenState extends State<MPWalkThroughScreen> with AfterLayoutMixin<MPWalkThroughScreen> {
  PageController pageController = PageController();
  List<Widget> pages = [];
  double? currentPage = 0;

  final _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();

    init();
  }

  Future<void> init() async {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    pages = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          commonCacheImageWidget(mpImages_1, 200, width: 200, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
          16.height,
          Text('Enjoy Music In Real Time', style: boldTextStyle(color: Colors.white)),
          8.height,
          Text('Nunc pharetra ultricies leo, in blandit\n libero auctor sed.', style: secondaryTextStyle(color: Colors.white), textAlign: TextAlign.center)
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          commonCacheImageWidget(mpImages_2, 200, width: 200, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
          16.height,
          Text('Create Your Own Music List', style: boldTextStyle(color: Colors.white)),
          8.height,
          Text('Vestibulum ante ipsum primis in \n faucibus orci luctus.', style: secondaryTextStyle(color: Colors.white), textAlign: TextAlign.center)
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          commonCacheImageWidget(mpImages_3, 200, width: 200, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
          16.height,
          Text('Real Time Music News', style: boldTextStyle(color: Colors.white)),
          8.height,
          Text(
            'Vivamus rhoncus hendrerit lacus,vitae \n prottitor odi pellentesque.',
            style: secondaryTextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          )
        ],
      )
    ];
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF181B2C),
        body: Stack(
          children: [
            PageView(controller: pageController, children: pages.map((e) => e).toList()),
            16.height,
            Container(
              margin: EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "SKIP",
                  style: boldTextStyle(color: Colors.white, size: 12),
                ).paddingAll(8).onTap(() {
                  finish(context);
                  MPTabBarSignInScreen(0).launch(context);
                }),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: DotIndicator(
                pageController: pageController,
                pages: pages,
                unselectedIndicatorColor: Colors.white,
                dotSize: 5,
                indicatorColor: mpAppButtonColor,
                onDotTap: (s) {
                  pageController.animateToPage(s, duration: Duration(milliseconds: 5), curve: Curves.bounceIn);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AppButton(
                color: mpAppButtonColor,
                width: context.width(),
                child: Text(currentPage == 2 ? 'Get Started' : 'Next', style: boldTextStyle(color: Colors.white)),
                onTap: () {
                  pageController.nextPage(duration: Duration(milliseconds: 500), curve: _kCurve);

                  if (currentPage == 2) {
                    finish(context);
                    MPSignInAndSignUpScreen().launch(context);
                  }
                },
              ).paddingOnly(left: 16, right: 16, bottom: 16),
            )
          ],
        ),
      ),
    );
  }
}
