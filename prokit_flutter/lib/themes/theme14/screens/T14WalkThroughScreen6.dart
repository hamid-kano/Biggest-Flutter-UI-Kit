import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14WalkThroughScreen6 extends StatefulWidget {
  @override
  _T14WalkThroughScreen6State createState() => _T14WalkThroughScreen6State();
}

class _T14WalkThroughScreen6State extends State<T14WalkThroughScreen6> with AfterLayoutMixin<T14WalkThroughScreen6> {
  double? currentPage = 0;
  PageController _pageController = PageController(viewportFraction: 0.6);
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
      Align(alignment: Alignment.center, child: Image.asset(t14_mobile, height: context.height() * 0.44)),
      Align(alignment: Alignment.center, child: Image.asset(t14_mobile, height: context.height() * 0.44)),
      Align(alignment: Alignment.center, child: Image.asset(t14_mobile, height: context.height() * 0.44)),
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
      // backgroundColor: t14_WalkThrough6BgColor,
      body: Stack(
        children: [
          Container(
            height: context.height() * 0.6,
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.topLeft, colors: [t14_txt_Login4BgColor2, t14_txt_Login4BgColor1]),
            ),
          ),
          PageView(
            controller: _pageController,
            children: pages.map((e) => e).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: white,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DotIndicator(pageController: _pageController, pages: pages, indicatorColor: t14_TextField_BgColor),
                    16.height,
                    Text(t14_WalkThrough4_Title, textAlign: TextAlign.center, style: boldTextStyle(color: t14_colorBlue, size: 16)),
                    16.height,
                    t14AppButton(
                      context,
                      onPress: () {
                        _pageController.nextPage(duration: _kDuration, curve: _kCurve);
                      },
                      btnText: currentPage == 2 ? t14_btn_Get_Started : t14_lbl_SignIn3,
                      bgColor: t14_colorLightSkyBlue,
                      width: 150,
                      shape: 25.0,
                      txtColor: t14_txt_BlueColor,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
