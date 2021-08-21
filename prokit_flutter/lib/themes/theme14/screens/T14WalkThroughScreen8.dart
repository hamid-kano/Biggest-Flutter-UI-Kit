import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14WalkThroughScreen8 extends StatefulWidget {
  @override
  _T14WalkThroughScreen8State createState() => _T14WalkThroughScreen8State();
}

class _T14WalkThroughScreen8State extends State<T14WalkThroughScreen8> with AfterLayoutMixin<T14WalkThroughScreen8> {
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
      Image.asset(t14_WalkThrough8, height: context.height()),
      Image.asset(t14_WalkThrough8, height: context.height()),
      Image.asset(t14_WalkThrough8, height: context.height()),
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
        body: Stack(
          children: [
            Container(
              height: context.height() * 0.72,
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(180)),
                backgroundColor: t14_WalkThrough8BgColor,
              ),
            ),
            Container(
              height: context.height() - 0.5,
              child: PageView(
                controller: _pageController,
                children: pages.map((e) => e.cornerRadiusWithClipRRectOnly(bottomRight: 140)).toList(),
              ),
            ).cornerRadiusWithClipRRectOnly(bottomRight: 160),
            Positioned(
              bottom: 0,
              height: context.height() * 0.34,
              width: context.width(),
              child: Container(
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
                  backgroundColor: Colors.white,
                ),
                padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DotIndicator(pageController: _pageController, pages: pages, indicatorColor: t14_TextField_BgColor),
                    16.height,
                    Text(t14_WalkThrough8_Title, style: boldTextStyle(size: 20)),
                    16.height,
                    Text(t14_WalkThrough8_SubTitle, textAlign: TextAlign.center, style: secondaryTextStyle(size: 16)),
                    16.height,
                    t14AppButton(
                      context,
                      onPress: () {
                        _pageController.nextPage(duration: _kDuration, curve: _kCurve);
                      },
                      btnText: currentPage == 2 ? t14_btn_WalkThrough2Start : t14_lbl_SignIn3,
                      bgColor: t14_colorLightSkyBlue,
                      width: 150,
                      shape: 25.0,
                      txtColor: t14_txt_BlueColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
