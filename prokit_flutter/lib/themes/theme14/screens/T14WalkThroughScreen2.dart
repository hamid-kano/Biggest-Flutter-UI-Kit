import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14WalkThroughScreen2 extends StatefulWidget {
  @override
  _T14WalkThroughScreen2State createState() => _T14WalkThroughScreen2State();
}

class _T14WalkThroughScreen2State extends State<T14WalkThroughScreen2> with AfterLayoutMixin<T14WalkThroughScreen2> {
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
      Align(alignment: Alignment.topCenter, child: Image.asset(t14_profile1, height: 150, width: 150, fit: BoxFit.cover)),
      Align(alignment: Alignment.topCenter, child: Image.asset(t14_profile2, height: 150, width: 150, fit: BoxFit.cover)),
      Align(alignment: Alignment.topCenter, child: Image.asset(t14_profile3, height: 150, width: 150, fit: BoxFit.cover)),
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
      backgroundColor: t14_SuccessBgColor2,
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
              Text(t14_txt_WalkThrough2_title, textAlign: TextAlign.center, style: boldTextStyle(size: 18)),
              16.height,
              Text(t14_txt_WalkThrough2_SubTitle, style: secondaryTextStyle(size: 16), textAlign: TextAlign.center),
              16.height,
              DotIndicator(pageController: _pageController, pages: pages, indicatorColor: t14_TextField_BgColor),
              16.height,
              t14AppButton(
                context,
                btnText: currentPage == 2 ? t14_btn_WalkThrough2 : t14_lbl_SignIn3,
                bgColor: t14_colorWhite,
                width: context.width(),
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
    );
  }
}
