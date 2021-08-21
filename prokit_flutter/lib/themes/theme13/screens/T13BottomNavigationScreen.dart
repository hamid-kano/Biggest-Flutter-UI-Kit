import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Colors.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Images.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Strings.dart';

import '../../../main.dart';

class T13BottomNavigationScreen extends StatefulWidget {
  static String tag = '/T13BottomNavigationScreen';

  @override
  T13BottomNavigationScreenState createState() => T13BottomNavigationScreenState();
}

class T13BottomNavigationScreenState extends State<T13BottomNavigationScreen> {
  var isSelected = 1;

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
            padding: EdgeInsets.all(4.0),
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

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      appBar: appBar(context, t13_lbl_bottom_navigation),
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            height: 70,
            decoration: boxDecoration(showShadow: true, color: appStore.appBarColor!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                tabItem(1, t13_ic_search, t13_lbl_search),
                tabItem(2, t13_ic_bookmark, t13_lbl_bookmark),
                tabItem(3, t13_ic_user, t13_lbl_user),
                tabItem(4, t13_ic_settings, t13_lbl_setting),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(child: Text('Screen $isSelected', style: boldTextStyle(size: 20)), alignment: Alignment.center),
      ),
    );
  }
}
