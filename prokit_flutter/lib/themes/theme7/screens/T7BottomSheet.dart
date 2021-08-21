import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Colors.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Constant.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Strings.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Widget.dart';

import '../../../main.dart';

class T7BottomSheet extends StatefulWidget {
  static String tag = '/T7BottomSheet';

  @override
  T7BottomSheetState createState() => T7BottomSheetState();
}

class T7BottomSheetState extends State<T7BottomSheet> {
  GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    scaffoldKey = new GlobalKey<ScaffoldState>();
    Future.delayed(Duration(milliseconds: 1000), () {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 10,
                  decoration: boxDecoration(color: t7view_color, radius: 16, bgColor: appStore.scaffoldBackground),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), color: appStore.scaffoldBackground),
                  height: MediaQuery.of(context).size.width * 1.0,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(t7_beggar_fee_information, textColor: appStore.textPrimaryColor, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                          SizedBox(height: 8),
                          Text(t7_sample_long_text, style: secondaryTextStyle(size: 14)),
                          SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text(t7_airline, textColor: appStore.textPrimaryColor),
                              text(t7_emirates_airlines, textColor: appStore.textSecondaryColor),
                            ],
                          ),
                          divider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text(t7_carry_on_bag, textColor: appStore.textPrimaryColor),
                              text(t7_fee_free_up_to_15_kg, textColor: appStore.textSecondaryColor),
                            ],
                          ),
                          divider(),
                          SizedBox(height: 16),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: T7Button(
                              textContent: t7_got_it,
                              onPressed: () {},
                              bgColor: t7view_color,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          });
    });
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[],
      ),
    );
  }
}
