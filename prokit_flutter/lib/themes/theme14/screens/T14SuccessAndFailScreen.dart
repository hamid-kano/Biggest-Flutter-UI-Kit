import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14SuccessAndFailScreen extends StatefulWidget {
  @override
  _T14SuccessAndFailScreenState createState() => _T14SuccessAndFailScreenState();
}

class _T14SuccessAndFailScreenState extends State<T14SuccessAndFailScreen> with AfterLayoutMixin<T14SuccessAndFailScreen> {
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
  void afterFirstLayout(BuildContext context) {
    pages = [
      t14PageView1Widget(),
      t14PageView2Widget(),
      t14SuccessWidget(),
      t14PageView4Widget(),
      t14PageView5Widget(),
    ];
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget t14PageView1Widget() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [t14_SuccessBgColor, t14_SuccessBgColor]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            t14_success,
            width: 220,
            height: 220,
          ).paddingOnly(top: 80),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Success', style: boldTextStyle(color: t14_colorBlue, size: 20)),
              16.height,
              Text(t14_txt_Success_txt3, textAlign: TextAlign.center, style: primaryTextStyle(size: 18)),
              34.height,
              t14AppButton(context, width: 120, bgColor: white, btnText: 'Done', shape: 20.0, txtColor: t14_colorBlack),
            ],
          ),
        ],
      ),
    );
  }

  Widget t14PageView2Widget() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [t14_SuccessBgColor1, t14_SuccessBgColor2]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            t14_opps,
            width: 220,
            height: 220,
          ).paddingOnly(top: 80),
          Column(
            children: [
              Text('Thank you for our subscription!', style: boldTextStyle(color: t14_colorBlue, size: 20)),
              16.height,
              Text(t14_txt_Success_Title_txt3, textAlign: TextAlign.center, style: primaryTextStyle(size: 18, color: t14_SuccessTxtColor)),
              34.height,
              t14AppButton(context, width: 120, bgColor: white, btnText: 'Confirm', shape: 20.0, txtColor: t14_colorBlack),
            ],
          ),
        ],
      ),
    );
  }

  Widget t14PageView4Widget() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [t14_OppsColor1, t14_OppsColor2]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            t14_opps,
            width: 220,
            height: 220,
          ).paddingOnly(top: 80),
          Column(
            children: [
              Text(t14_txt_Failed_txt, textAlign: TextAlign.center, style: primaryTextStyle(size: 18, color: t14_SuccessTxtColor)),
              34.height,
              t14AppButton(context, width: 120, bgColor: white, btnText: 'Try again', shape: 20.0, txtColor: t14_colorBlack),
            ],
          ),
        ],
      ),
    );
  }

  Widget t14PageView5Widget() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [t14_OppsBgColor1, t14_OppsBgColor2]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            t14_oopsIcon,
            width: 220,
            height: 220,
          ).paddingOnly(top: 80),
          Text('Oooops', style: boldTextStyle(color: t14_colorBlue, size: 20)),
          16.height,
          Text(t14_txt_Failed_txt2, textAlign: TextAlign.center, style: primaryTextStyle(size: 18, color: t14_OppsColor)),
          34.height,
          t14AppButton(context, width: 120, bgColor: white, btnText: 'Try again', shape: 20.0, txtColor: t14_colorBlack),
        ],
      ),
    );
  }

  Widget t14SuccessWidget() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [t14_SuccessBgColor, t14_colorWhite]),
      ),
      child: Column(
        children: [
          Container(
            color: t14_colorWhite,
            height: 300,
            width: 300,
            child: Column(
              children: [
                Image.asset(t14_success, width: 100, height: 100).paddingOnly(top: 80),
                16.height,
                Text('Success', style: boldTextStyle(color: t14_colorBlack, size: 20)),
                Text(t14_txt_Success2_txt, textAlign: TextAlign.center, style: primaryTextStyle(size: 18, color: t14_SuccessTxtColor)).paddingAll(16),
              ],
            ),
          ).center().expand(),
          t14AppButton(context, width: 200, bgColor: t14_SignInBgColor, btnText: 'Done', shape: 20.0, txtColor: t14_colorSkyBlue),
          16.height,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(controller: _pageController, children: pages.map((e) => e).toList()),
          Positioned(
            bottom: 75,
            child: Center(
              child: Container(
                width: context.width(),
                child: DotIndicator(pageController: _pageController, pages: pages, indicatorColor: t14_TextField_BgColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
