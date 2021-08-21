import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10Colors.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10Constant.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10Images.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10Strings.dart';

import '../../../main.dart';

class T10SideMenu extends StatefulWidget {
  static String tag = '/T10SideMenu';

  @override
  T10SideMenuState createState() => T10SideMenuState();
}

class T10SideMenuState extends State<T10SideMenu> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      key: _scaffoldKey,
      body: Container(
        child: SafeArea(
          child: IconButton(
            icon: Icon(Icons.menu, color: appStore.iconColor),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
      ),
      drawer: T10Drawer(),
    );
  }
}

class T10Drawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return T10DrawerState();
  }
}

class T10DrawerState extends State<T10Drawer> {
  var selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        elevation: 8,
        child: Container(
          color: appStore.scaffoldBackground,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: appStore.scaffoldBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                  Center(
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(t10_profile),
                          radius: MediaQuery.of(context).size.width * 0.15,
                        ),
                        SizedBox(height: 10),
                        text(theme10_user_name, fontFamily: fontBold, textColor: t10_colorPrimary),
                        text(theme10_user_email, textColor: t10_colorPrimary),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  getDrawerItem(theme10_lbl_home, 1),
                  mView(),
                  getDrawerItem(theme10_lbl_profile, 2),
                  mView(),
                  getDrawerItem(theme10_lbl_appointments, 3),
                  mView(),
                  getDrawerItem(theme10_lbl_events, 4),
                  mView(),
                  getDrawerItem(theme10_lbl_toc, 5),
                  mView(),
                  getDrawerItem(theme10_lbl_privacy, 6),
                  mView(),
                  getDrawerItem(theme10_lbl_logout, 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerItem(String name, int pos) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = pos;
        });
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          color: selectedItem == pos ? t10_colorPrimary_light : appStore.scaffoldBackground,
          child: Row(
            children: <Widget>[
              Container(
                width: 4,
                height: MediaQuery.of(context).size.width * 0.13,
                color: selectedItem == pos ? t10_colorPrimary : appStore.scaffoldBackground,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: text(name, textColor: selectedItem == pos ? appStore.textPrimaryColor : t10_textColorSecondary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
              )
            ],
          )),
    );
  }

  Widget mView() {
    return Divider(
      color: t10_view_color,
      height: 1,
    );
  }
}
