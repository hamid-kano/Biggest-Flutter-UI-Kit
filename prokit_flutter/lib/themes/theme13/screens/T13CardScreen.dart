import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Colors.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Images.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Strings.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Widget.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Constant.dart';
import 'package:prokit_flutter/themes/theme13/model/T13Model.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13DataGenerator.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class T13CardScreen extends StatefulWidget {
  static String tag = '/T13CardScreen';

  @override
  T13CardScreenState createState() => T13CardScreenState();
}

class T13CardScreenState extends State<T13CardScreen> {
  int selectedPos = 1;
  late List<Home> mList;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mList = generatePopular();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    var width = MediaQuery.of(context).size.width;
    var mTop = Container(
      margin: EdgeInsets.only(left: spacing_large, right: spacing_large, bottom: spacing_standard_new),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedPos = 1;
                });
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[selectedPos == 1 ? t13_colorPrimary : Colors.transparent, selectedPos == 1 ? t13_color_gradient1 : Colors.transparent]),
                    borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    border: Border.all(color: t13_colorPrimary)),
                child: text(
                  t13_lbl_bookmarks,
                  isCentered: true,
                  textColor: selectedPos == 1 ? t13_white : t13_colorPrimary,
                ),
              ),
            ),
            flex: 1,
          ),
          SizedBox(width: spacing_standard_new),
          Expanded(
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPos = 2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  width: width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[selectedPos == 2 ? t13_colorPrimary : Colors.transparent, selectedPos == 2 ? t13_color_gradient1 : Colors.transparent]),
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      border: Border.all(color: t13_colorPrimary)),
                  child: text(
                    t13_lbl_last_watched,
                    isCentered: true,
                    textColor: selectedPos == 2 ? t13_white : t13_colorPrimary,
                  ),
                )),
            flex: 1,
          ),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      appBar: appBar(context, t13_lbl_cards),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            mTop,
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Properties(mList[index], index);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Properties extends StatelessWidget {
  late Home model;

  Properties(Home model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.7,
      decoration: boxDecoration(showShadow: true, bgColor: appStore.appBarColor, radius: 10.0),
      margin: EdgeInsets.only(left: spacing_standard_new, bottom: spacing_standard_new, right: spacing_standard_new),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(spacing_middle), topRight: Radius.circular(spacing_middle)),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                commonCacheImageWidget(model.image, width * 0.4, fit: BoxFit.cover, width: width),
                mSale(context),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(model.name, textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                    text(model.price, textColor: appStore.textSecondaryColor),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(right: spacing_control),
                              child: SvgPicture.asset(t13_ic_map, color: t13_textColorSecondary, width: 18, height: 18),
                            ),
                          ),
                          TextSpan(text: model.place, style: TextStyle(fontSize: textSizeMedium, color: t13_textColorSecondary)),
                        ],
                      ),
                    ),
                    SizedBox(width: spacing_standard_new),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(right: spacing_control),
                              child: SvgPicture.asset(t13_ic_home, color: t13_textColorSecondary, width: 18, height: 18),
                            ),
                          ),
                          TextSpan(text: model.sqm, style: TextStyle(fontSize: textSizeMedium, color: t13_textColorSecondary)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
