import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Colors.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Images.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Strings.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Widget.dart';

import '../../../main.dart';

class T8BottomNavigation extends StatefulWidget {
  static String tag = '/T8BottomNavigation';

  @override
  T8BottomNavigationState createState() => T8BottomNavigationState();
}

class T8BottomNavigationState extends State<T8BottomNavigation> {
  var isSelected = 1;

  Widget tabItem(var pos, var icon, var title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = pos;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: 50,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              icon,
              width: MediaQuery.of(context).size.width * 0.07,
              height: 20,
              color: isSelected == pos ? t8_colorPrimary : t8_icon_color,
            ),
            text(
              title,
              textColor: isSelected == pos ? t8_colorPrimary : t8_icon_color,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.scaffoldBackground!);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(alignment: Alignment.topCenter, child: t8HeaderText(t8_title_bottom_navigation)),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: appStore.scaffoldBackground,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: t8_ShadowColor, blurRadius: 10, spreadRadius: 2, offset: Offset(0, 3.0)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 0.0, right: 0, top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              tabItem(1, t8_ic_homes, "Home"),
              tabItem(2, t8_ic_quiz, "Quiz"),
              tabItem(3, t8_ic_user, "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
