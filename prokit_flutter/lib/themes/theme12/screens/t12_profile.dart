import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/dots_indicator/dots_indicator.dart';
import 'package:prokit_flutter/themes/theme12/models/T12Models.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_colors.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_constant.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_data_generator.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_images.dart';

import '../../../main.dart';

class T12Profile extends StatefulWidget {
  static String tag = '/T12Profile';

  @override
  T12ProfileState createState() => T12ProfileState();
}

class T12ProfileState extends State<T12Profile> {
  List<T12Slider> cards = [];
  List<T12Slider> accounts = [];
  var position = 0;
  // ignore: non_constant_identifier_names
  var ac_position = 0;

  @override
  void initState() {
    super.initState();
    cards.addAll(getCards());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var cardHight = (width - 48) * (9 / 16);
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      appBar: appBar(context, "Profile"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: boxDecoration(bgColor: appStore.scaffoldBackground, showShadow: true, radius: spacing_standard),
              child: Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Container(
                    color: appStore.scaffoldBackground,
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: t12_primary_color, width: 2)),
                          child: CircleAvatar(backgroundColor: Colors.white, backgroundImage: AssetImage(t12_profile), radius: 45).paddingAll(3),
                        ),
                        text("James Dennis", textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal).paddingTop(spacing_control),
                        text("Ui/UX Designer", textColor: appStore.textSecondaryColor, fontSize: textSizeMedium).paddingTop(spacing_control_half),
                      ],
                    ).paddingAll(spacing_standard_new),
                    width: double.infinity,
                  ),
                  text("Edit", textColor: t12_primary_color, fontFamily: fontMedium).paddingAll(spacing_standard).onTap(() {})
                ],
              ),
            ).paddingAll(spacing_standard_new),
            Container(
              width: double.infinity,
              decoration: boxDecoration(bgColor: appStore.scaffoldBackground, showShadow: true, radius: spacing_standard),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      text("Cards", textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeLargeMedium),
                      Expanded(
                          child: text("(" + (position + 1).toString() + "/" + cards.length.toString() + ")", textColor: appStore.textSecondaryColor, fontSize: textSizeMedium, fontFamily: fontMedium)
                              .paddingLeft(spacing_control)),
                      Icon(Icons.add_circle_outline, size: 20, color: t12_primary_color)
                    ],
                  ).paddingAll(spacing_standard_new),
                  Container(
                    height: cardHight,
                    child: PageView.builder(
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          height: cardHight,
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: t12_gradient_colors[index % t12_gradient_colors.length], begin: Alignment.topRight),
                                  borderRadius: BorderRadius.all(Radius.circular(spacing_standard)),
                                ),
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      text("Shopping Card", textColor: Colors.white.withOpacity(0.7), fontSize: textSizeMedium),
                                      Image.asset("images/theme12/mastercard.png", width: 40, height: 40)
                                    ],
                                  ),
                                  Expanded(child: text("**** **** **** 3960", textColor: Colors.white, fontFamily: fontBold, fontSize: textSizeNormal).paddingTop(spacing_standard)),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            text("CARD HOLDER", textColor: Colors.white.withOpacity(0.7), fontSize: textSizeMedium),
                                            text("JAMES DENNIS", textColor: Colors.white, fontSize: textSizeMedium, fontFamily: fontMedium),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          text("EXPIRES", textColor: Colors.white.withOpacity(0.7), fontSize: textSizeMedium),
                                          text("10/22", textColor: Colors.white, fontSize: textSizeMedium, fontFamily: fontMedium),
                                        ],
                                      ).paddingRight(spacing_standard_new),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          text("CVV", textColor: Colors.white.withOpacity(0.7), fontSize: textSizeMedium),
                                          text("***", textColor: Colors.white, fontSize: textSizeMedium, fontFamily: fontMedium),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ).paddingAll(spacing_standard_new)
                            ],
                          ),
                        );
                      },
                      onPageChanged: (index) {
                        setState(() {
                          position = index;
                        });
                      },
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: cards.length,
                    position: position,
                    decorator: DotsDecorator(
                      color: t12_text_secondary.withOpacity(0.15),
                      activeColor: t12_primary_color,
                      activeSize: Size.square(spacing_middle),
                      spacing: EdgeInsets.all(3),
                    ),
                  ).paddingAll(spacing_standard)
                ],
              ).paddingBottom(spacing_standard),
            ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
            Container(
              width: double.infinity,
              decoration: boxDecoration(bgColor: appStore.scaffoldBackground, showShadow: true, radius: spacing_standard),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      text("Bank Accounts", textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeLargeMedium),
                      Expanded(
                          child:
                              text("(" + (ac_position + 1).toString() + "/2)", textColor: appStore.textSecondaryColor, fontSize: textSizeMedium, fontFamily: fontMedium).paddingLeft(spacing_control)),
                      Icon(Icons.add_circle_outline, size: 20, color: t12_primary_color)
                    ],
                  ).paddingAll(spacing_standard_new),
                  Container(
                    height: cardHight * 0.7,
                    child: PageView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text("Bank Name", textColor: appStore.textPrimaryColor, fontSize: textSizeMedium),
                                text("City Bank", textColor: appStore.textSecondaryColor, fontFamily: fontMedium),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      text("Account Name", textColor: appStore.textPrimaryColor, fontSize: textSizeMedium),
                                      text("James Dennis", textColor: appStore.textSecondaryColor, fontFamily: fontMedium),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      text("Ac. Number", textColor: appStore.textPrimaryColor, fontSize: textSizeMedium),
                                      text("737427527", textColor: appStore.textSecondaryColor, fontFamily: fontMedium),
                                    ],
                                  ),
                                ),
                              ],
                            ).paddingTop(spacing_standard)
                          ],
                        ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new);
                      },
                      onPageChanged: (index) {
                        setState(() {
                          ac_position = index;
                        });
                      },
                    ),
                  ),
                ],
              ).paddingBottom(spacing_standard),
            ).paddingAll(spacing_standard_new)
          ],
        ),
      ),
    );
  }
}
