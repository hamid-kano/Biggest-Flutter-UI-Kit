import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14WalkThroughScreen1 extends StatefulWidget {
  @override
  _T14WalkThroughScreen1State createState() => _T14WalkThroughScreen1State();
}

class _T14WalkThroughScreen1State extends State<T14WalkThroughScreen1> with AfterLayoutMixin<T14WalkThroughScreen1> {
  double? currentPage = 0;
  PageController _pageController = PageController(viewportFraction: 0.7);
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
          height: 150,
          width: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: t14_txt_BlueColor),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: t14_colorBlue),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: t14_colorWhite),
        ),
      ),
    ];
    setState(() {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: t14_WalkThrough6BgColor,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: pages.map((e) => e).toList(),
            ).paddingOnly(top: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(t14_txt_WalkThrough1_title, textAlign: TextAlign.center, style: boldTextStyle(size: 18)),
                16.height,
                Text(t14_txt_WalkThrough1_SubTitle, style: secondaryTextStyle(size: 16), textAlign: TextAlign.center),
                16.height,
                DotIndicator(pageController: _pageController, pages: pages, indicatorColor: t14_TextField_BgColor),
                16.height,
                t14AppButton(
                  context,
                  btnText: currentPage == 2 ? t14_btn_GetStart : t14_lbl_SignIn3,
                  bgColor: t14_colorWhite,
                  width: 120,
                  shape: 25.0,
                  onPress: () {
                    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
                  },
                  txtColor: t14_colorBlack,
                ),
              ],
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
