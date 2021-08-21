import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Colors.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Constant.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Strings.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Widget.dart';
import 'package:prokit_flutter/themes/theme6/utils/Widget/T6Bar.dart';

import '../../../main.dart';

class T6Cards extends StatelessWidget {
  static String tag = '/T6Cards';

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          TopBar(
            titleName: t6_lbl_cards,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                16.height,
                Container(
                  margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                  decoration: boxDecoration(radius: 16, showShadow: true, bgColor: appStore.scaffoldBackground),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(t6_lbl_calories, textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                        text(t6_lbl_today, fontSize: textSizeSMedium),
                        SizedBox(height: 16),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Bar(0.1),
                              Bar(0.4),
                              Bar(0.5),
                              Bar(0.7),
                              Bar(0.8),
                              Bar(0.9),
                              Bar(0.98),
                              Bar(0.84),
                              Bar(0.94),
                              Bar(0.54),
                              Bar(0.94),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                  decoration: boxDecoration(radius: 16, showShadow: true, bgColor: appStore.scaffoldBackground),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(t6_lbl_steps, textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                        text(t6_lbl_today, fontSize: textSizeSMedium),
                        SizedBox(height: 16),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Bar(0.94),
                              Bar(0.6),
                              Bar(0.4),
                              Bar(0.5),
                              Bar(0.7),
                              Bar(0.8),
                              Bar(0.9),
                              Bar(0.98),
                              Bar(0.99),
                              Bar(0.94),
                              Bar(0.54),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                  decoration: boxDecoration(radius: 16, showShadow: true, bgColor: appStore.scaffoldBackground),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text(t6_lbl_your_activity_today, textColor: appStore.textSecondaryColor, fontFamily: fontMedium),
                            text(t6_lbl__4_35_today, textColor: t6form_google),
                          ],
                        ),
                        SizedBox(height: 8),
                        text(t6_lbl_crossfit_program, textColor: appStore.textSecondaryColor, fontFamily: fontMedium),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text(t6_lbl_squatting_with_ball, textColor: appStore.textSecondaryColor),
                            text(t6_lbl__4_35_today, textColor: t6colorPrimary),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text(t6_lbl_running_in_the_place_with_the_ball, textColor: appStore.textSecondaryColor).expand(),
                            text(t6_lbl__4_35_today, textColor: t6colorPrimary),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
