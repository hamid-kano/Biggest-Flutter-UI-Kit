import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme3/utils/T3BottomNavigationBar.dart';
import 'package:prokit_flutter/themes/theme3/utils/T3Images.dart';
import 'package:prokit_flutter/themes/theme3/utils/colors.dart';
import 'package:prokit_flutter/themes/theme3/utils/strings.dart';

class T3BottomNavigation extends StatefulWidget {
  static var tag = "/T3BottomNavigation";

  @override
  T3BottomNavigationState createState() => T3BottomNavigationState();
}

class T3BottomNavigationState extends State<T3BottomNavigation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      appBar: appBar(context, t3_lbl_bottom_navigation),
      body: SafeArea(
        child: Observer(
          builder: (_) => Container(
            color: appStore.scaffoldBackground,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 180,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150.0),
                          border: Border.all(
                            width: 16.0,
                            color: t3_colorPrimary,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(t3_lbl_welcome_to_bottom_n_navigation_bar, style: boldTextStyle(size: 16), maxLines: 2, textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: appStore.scaffoldBackground,
        child: CurvedNavigationBar(
          backgroundColor: appStore.scaffoldBackground,
          color: appStore.appBarColor,
          items: <Widget>[
            SvgPicture.asset(t3_ic_home, height: 24, width: 24, fit: BoxFit.none, color: appStore.iconColor),
            SvgPicture.asset(t3_ic_msg, height: 24, width: 24, fit: BoxFit.none, color: appStore.iconColor),
            SvgPicture.asset(t3_notification, height: 24, width: 24, fit: BoxFit.none, color: appStore.iconColor),
            SvgPicture.asset(t3_ic_user, height: 24, width: 24, fit: BoxFit.none, color: appStore.iconColor),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
    );
  }
}
