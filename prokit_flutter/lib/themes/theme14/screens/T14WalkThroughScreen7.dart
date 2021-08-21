import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

class T14WalkThroughScreen7 extends StatefulWidget {
  @override
  _T14WalkThroughScreen7State createState() => _T14WalkThroughScreen7State();
}

class _T14WalkThroughScreen7State extends State<T14WalkThroughScreen7> with AfterLayoutMixin<T14WalkThroughScreen7> {
  double? currentPage = 0;

  PageController _pageController = PageController();
  List<Widget> pages = [];

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
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void afterFirstLayout(BuildContext context) {
    pages = [
      Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.all(Radius.circular(24)), backgroundColor: t14_colorPink),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            16.height,
            Image.asset(t14_splashIcon, height: context.height() * 0.4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t14_txt_WalkThrough2_title, style: boldTextStyle(size: 22)),
                16.height,
                Text(t14_WalkThrough4_SubTitle, style: secondaryTextStyle(size: 16)),
                16.height,
              ],
            ),
            16.height,
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.all(Radius.circular(16)), backgroundColor: t14_colorPink),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            16.height,
            Image.asset(t14_splashIcon, height: context.height() * 0.4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t14_txt_WalkThrough2_title, style: boldTextStyle(size: 22)),
                16.height,
                Text(t14_WalkThrough4_SubTitle, style: secondaryTextStyle(size: 16)),
                16.height,
              ],
            ),
            16.height,
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.all(Radius.circular(16)), backgroundColor: t14_colorPink),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            16.height,
            Image.asset(t14_splashIcon, height: context.height() * 0.4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t14_txt_WalkThrough2_title, style: boldTextStyle(size: 22)),
                16.height,
                Text(t14_WalkThrough4_SubTitle, style: secondaryTextStyle(size: 16)),
                16.height,
              ],
            ),
            16.height,
          ],
        ),
      ),
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: pages.map((e) => e).toList(),
            ),
            Positioned(
              top: 24,
              left: 0,
              right: 0,
              child: Text(t14_txt_Skip, textAlign: TextAlign.center, style: boldTextStyle(color: t14_colorBlue, size: 16)).onTap(() {
                finish(context);
              }),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 24,
              child: DotIndicator(pageController: _pageController, pages: pages, indicatorColor: t14_TextField_BgColor),
            ),
          ],
        ),
      ),
    );
  }
}
