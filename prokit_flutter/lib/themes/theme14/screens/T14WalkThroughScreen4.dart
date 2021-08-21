import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

class T14WalkThroughScreen4 extends StatefulWidget {
  @override
  _T14WalkThroughScreen4State createState() => _T14WalkThroughScreen4State();
}

class _T14WalkThroughScreen4State extends State<T14WalkThroughScreen4> with AfterLayoutMixin<T14WalkThroughScreen4> {
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
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: t14_txt_BlueColor),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: t14_colorBlue),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: t14_finance3_spending1),
        ),
      ),
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.topRight, colors: [t14_WalkThrough4BgColor1, t14_WalkThrough4BgColor2]),
            ),
          ),
          PageView(
            controller: _pageController,
            children: pages.map((e) => e).toList(),
          ).paddingOnly(top: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(t14_WalkThrough4_Title, textAlign: TextAlign.center, style: boldTextStyle(size: 20)),
              16.height,
              Text(t14_WalkThrough4_SubTitle, style: primaryTextStyle(size: 16), textAlign: TextAlign.center),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DotIndicator(pageController: _pageController, pages: pages, indicatorColor: t14_colorBlue),
                  TextButton(
                      onPressed: () {
                        _pageController.nextPage(duration: _kDuration, curve: _kCurve);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(currentPage == 2 ? t14_btn_WalkThrough2Start : t14_lbl_SignIn3, style: boldTextStyle(color: black, size: 14)),
                          16.width,
                          Icon(Icons.arrow_forward_ios_sharp, size: 16),
                        ],
                      )),
                ],
              ),
            ],
          ).paddingAll(16),
        ],
      ),
    );
  }
}
