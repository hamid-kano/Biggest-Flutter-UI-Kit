import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Constant.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Images.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Strings.dart';

class T1SideMenu extends StatefulWidget {
  static var tag = "/T1SideMenu";

  @override
  State<StatefulWidget> createState() {
    return T1SideMenuState();
  }
}

class T1SideMenuState extends State<T1SideMenu> {
  bool isCollapsed = true;
  final Duration duration = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Future.delayed(Duration(seconds: 1), () {
      isCollapsed = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;

    Widget menuItem(String name) {
      return Column(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              text(name, textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
              Icon(Icons.keyboard_arrow_right, color: appStore.textPrimaryColor),
            ],
          ),
          SizedBox(height: 10),
          Divider(height: 0.5, color: t1_view_color)
        ],
      );
    }

    return Scaffold(
        body: Observer(
      builder: (_) => Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(right: width / 4),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height + 100,
                color: appStore.scaffoldBackground,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: t1_white, border: Border.all(width: 3, color: t1_colorPrimary)),
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(t1_ic_user1),
                            radius: width / 7,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      text(t1_user_name, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal),
                      text(t1_user_email, textColor: t1_colorPrimary, fontSize: textSizeMedium),
                      SizedBox(height: 24),
                      menuItem(t1_lbl_connect_to_pc),
                      menuItem(t1_lbl_share_files),
                      menuItem(t1_lbl_profile_edit),
                      menuItem(t1_lbl_refer_earn),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              text(t1_lbl_offers, textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                              Container(
                                margin: EdgeInsets.only(left: 4),
                                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                decoration: boxDecoration(bgColor: t1_red, radius: 4),
                                child: text(t1_lbl_new, fontSize: textSizeSmall, textColor: t1_white),
                              )
                            ],
                          ),
                          Icon(Icons.keyboard_arrow_right, color: appStore.textPrimaryColor)
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(height: 0.5, color: t1_view_color),
                      menuItem(t1_lbl_help),
                      menuItem(t1_lbl_about_us),
                      menuItem(t1_lbl_setting),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: text(t1_lbl_logout, textColor: t1_colorPrimary, fontFamily: fontSemibold, fontSize: textSizeNormal),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: duration,
            top: isCollapsed ? 0 : 0.2 * height,
            bottom: isCollapsed ? 0 : 0.2 * height,
            left: isCollapsed ? 0 : 0.8 * width,
            right: isCollapsed ? 0 : -0.2 * width,
            child: Material(
              child: Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: boxDecoration(radius: 0, bgColor: appStore.scaffoldBackground, showShadow: true),
                child: SafeArea(
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      setState(() {
                        isCollapsed = !isCollapsed;
                      });
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
