import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme13/model/T13Model.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Colors.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Constant.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13DataGenerator.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Images.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Strings.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Widget.dart';

import '../../../main.dart';
import 'T13ProfileScreen.dart';

class T13DashboardScreen extends StatefulWidget {
  static String tag = '/T13DashboardScreen';

  @override
  T13DashboardScreenState createState() => T13DashboardScreenState();
}

class T13DashboardScreenState extends State<T13DashboardScreen> {
  late List<Home> mList;
  late List<Home> mList1;
  int selectedPos = 1;
  int isSelected = 1;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mList = generatePopular();
    mList1 = generateFeatured();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    var width = MediaQuery.of(context).size.width;

    double expandHeight = 340;

    Widget mTitle(String value) {
      return Container(
        margin: EdgeInsets.only(left: spacing_standard_new),
        child: text(value.toUpperCase(), textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
      );
    }

    Widget tabItem(var pos, var icon, var name) {
      return GestureDetector(
        onTap: () {
          setState(() {
            isSelected = pos;
          });
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    icon,
                    width: 20,
                    height: 20,
                    color: isSelected == pos ? t13_colorPrimary : appStore.iconColor,
                  ),
                  text(name, textColor: isSelected == pos ? t13_colorPrimary : appStore.textPrimaryColor, fontSize: 12.0)
                ],
              ),
            ),
          ),
        ),
      );
    }

    var mTab = Container(
      alignment: Alignment.bottomLeft,
      height: 50,
      width: width,
      decoration: boxDecoration(radius: 45, bgColor: t13_menu_background, showShadow: false),
      margin: EdgeInsets.only(bottom: spacing_standard_new, right: spacing_standard_new, left: spacing_standard_new),
      child: Row(
        children: <Widget>[
          Flexible(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedPos = 1;
                });
              },
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  color: selectedPos == 1 ? t13_white : Colors.transparent,
                  border: Border.all(color: selectedPos == 1 ? t13_white : Colors.transparent),
                ),
                child: Center(
                  child: text(t13_lbl_buy, isCentered: true, textColor: selectedPos == 1 ? t13_colorPrimary : t13_textColorPrimary),
                ),
              ),
            ),
            flex: 1,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedPos = 2;
                });
              },
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  color: selectedPos == 2 ? t13_white : Colors.transparent,
                  border: Border.all(color: selectedPos == 2 ? t13_white : Colors.transparent),
                ),
                child: Center(
                  child: text(
                    t13_lbl_rent,
                    isCentered: true,
                    textColor: selectedPos == 2 ? t13_colorPrimary : t13_textColorPrimary,
                  ),
                ),
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: expandHeight,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              pinned: true,
              backgroundColor: appStore.appBarColor,
              actionsIconTheme: IconThemeData(opacity: 0.0),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: expandHeight,
                  color: appStore.appBarColor,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      commonCacheImageWidget(t13_ic_dashboard, expandHeight, width: width, fit: BoxFit.cover),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            height: 55,
                            child: mSearch,
                            margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: 80),
                          ),
                          mTab,
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16),
              mTitle(t13_lbl_featured_cities),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemCount: mList1.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Featured(mList1[index], index);
                  },
                ),
              ),
              SizedBox(height: 8),
              mTitle(t13_lbl_popular_properties),
              SizedBox(
                height: 290,
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemCount: mList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Properties(mList[index], index);
                  },
                ),
              ),
              mTitle(t13_lbl_featured_cities),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemCount: mList1.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Featured(mList1[index], index);
                  },
                ),
              ),
              SizedBox(height: 8),
              mTitle(t13_lbl_popular_properties),
              SizedBox(
                height: 290,
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemCount: mList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Properties(mList[index], index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            height: 70,
            decoration: boxDecoration(color: appStore.appBarColor!, showShadow: true),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(child: tabItem(1, t13_ic_search, t13_lbl_search), flex: 1),
                Flexible(child: tabItem(2, t13_ic_bookmark, t13_lbl_bookmark), flex: 1),
                Flexible(child: tabItem(3, t13_ic_user, t13_lbl_user), flex: 1),
                Flexible(child: tabItem(4, t13_ic_settings, t13_lbl_setting), flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Featured extends StatelessWidget {
  late Home model;

  Featured(Home model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: 200,
      decoration: boxDecoration(bgColor: appStore.appBarColor, showShadow: true, radius: 10),
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(spacing_middle), topRight: Radius.circular(spacing_middle)),
            child: commonCacheImageWidget(model.image, 160, width: width, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(spacing_standard),
            child: text(model.place, fontFamily: fontMedium),
          )
        ],
      ),
    );
  }
}
