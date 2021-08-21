import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

class T14WalkThroughScreen5 extends StatefulWidget {
  @override
  _T14WalkThroughScreen5State createState() => _T14WalkThroughScreen5State();
}

class _T14WalkThroughScreen5State extends State<T14WalkThroughScreen5> with AfterLayoutMixin<T14WalkThroughScreen5> {
  double? currentPage = 0;
  PageController _pageController = PageController();
  List<Widget> pages = [];

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

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
      Image.asset(t14_WalkThrough5, height: context.height(), width: context.width()),
      Image.asset(t14_WalkThrough5, height: context.height(), width: context.width()),
      Image.asset(t14_WalkThrough5, height: context.height(), width: context.width()),
    ];
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: t14_WalkThrough5BgColor,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: pages.map((e) => e).toList(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(top: 8),
              height: context.height() * 0.30,
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                backgroundColor: white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(t14_WalkThrough5_Title, textAlign: TextAlign.center, style: boldTextStyle(size: 20)).paddingOnly(top: 18),
                  Text(t14_WalkThrough5_SubTitle, style: secondaryTextStyle(size: 16), textAlign: TextAlign.center).paddingAll(16),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('Register', style: primaryTextStyle(color: t14_colorBlue)),
                      ),
                      DotIndicator(pageController: _pageController, indicatorColor: t14_colorBlue, pages: pages),
                      TextButton(
                        onPressed: () {
                          _pageController.nextPage(duration: _kDuration, curve: _kCurve);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(10),
                        ),
                        child: Text(
                          currentPage == 2 ? t14_btn_WalkThrough2Start : 'Next',
                          style: primaryTextStyle(color: currentPage == 2 ? t14_colorBlue : Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
