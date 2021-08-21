import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

class T14WalkThroughScreen3 extends StatefulWidget {
  @override
  _T14WalkThroughScreen3State createState() => _T14WalkThroughScreen3State();
}

class _T14WalkThroughScreen3State extends State<T14WalkThroughScreen3> with AfterLayoutMixin<T14WalkThroughScreen3> {
  double? currentPage = 0;

  PageController _pageController = PageController();
  List<Widget> pages = [];
  final _kDuration = Duration(milliseconds: 300);
  final _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });

    init();
  }

  init() async {}

  @override
  void afterFirstLayout(BuildContext context) {
    pages = [
      Image.asset(t14_travel1, fit: BoxFit.cover),
      Image.asset(t14_travel2, fit: BoxFit.cover),
      Image.asset(t14_travel3, fit: BoxFit.cover),
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
        backgroundColor: t14_WalkThroughBgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: t14_WalkThroughBgColor,
          elevation: 0.0,
          actions: [
            Text('Skip', style: boldTextStyle(size: 14)).onTap(() {
              finish(context);
            }).paddingOnly(right: 16, top: 8)
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Text(t14_WalkThrough3_Title, textAlign: TextAlign.center, style: boldTextStyle(color: t14_colorBlue, size: 18)),
                    16.height,
                    Text(t14_WalkThrough3_SubTitle, textAlign: TextAlign.center, style: secondaryTextStyle(size: 14)),
                    16.height,
                    Container(
                      width: context.width(),
                      padding: EdgeInsets.all(16),
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        backgroundColor: t14_WalkThroughBgColor,
                        border: Border.all(color: white, width: 1),
                      ),
                      child: Text(
                        currentPage == 2 ? t14_btn_GetStart : t14_lbl_SignIn3,
                        textAlign: TextAlign.center,
                        style: boldTextStyle(color: t14_colorBlue),
                      ),
                    ).onTap(() {
                      _pageController.nextPage(duration: _kDuration, curve: _kCurve);
                    }),
                    16.height,
                    DotIndicator(pageController: _pageController, indicatorColor: t14_colorBlue, pages: pages),
                  ],
                ).paddingOnly(left: 16, right: 16, bottom: 16),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PageView(
                    controller: _pageController,
                    children: pages.map((e) => e).toList(),
                  ),
                ).expand(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
