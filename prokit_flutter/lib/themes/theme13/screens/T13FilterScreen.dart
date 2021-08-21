import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Colors.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Strings.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Widget.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Constant.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class T13FilterScreen extends StatefulWidget {
  static String tag = '/T13FilterScreen';

  @override
  T13FilterScreenState createState() => T13FilterScreenState();
}

class T13FilterScreenState extends State<T13FilterScreen> {
  int totalBadRooms = 1;
  int totalBathRooms = 1;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    Widget mLabel(String value) {
      return text(value.toUpperCase(), textColor: appStore.textPrimaryColor);
    }

    var mView = Container(
      margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
      child: Divider(height: 1, color: t13_view_color),
    );

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      appBar: appBar(context, t13_lbl_filter),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(spacing_standard_new),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      mSearch,
                      mView,
                      mLabel(t13_lbl_price),
                      SizedBox(height: spacing_middle),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: t13EditTextStyle(t13_hint_from, isPassword: false, keyboardType: TextInputType.number),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: spacing_standard, right: spacing_standard),
                            child: Icon(Icons.remove),
                          ),
                          Expanded(
                            child: t13EditTextStyle(t13_hint_to, isPassword: false, keyboardType: TextInputType.number),
                          )
                        ],
                      ),
                      mView,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[mLabel(t13_lbl_types_of_property), Icon(Icons.more_horiz)],
                      ),
                      mView,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          mLabel(t13_lbl_bedrooms),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  color: t13_textColorSecondary,
                                ),
                                onTap: () {
                                  if (totalBadRooms == 1 || totalBadRooms < 1) {
                                    totalBadRooms = 1;
                                  } else {
                                    totalBadRooms = totalBadRooms - 1;
                                  }
                                  setState(() {});
                                },
                              ),
                              Container(
                                margin: EdgeInsets.only(left: spacing_middle, right: spacing_middle),
                                child: text(totalBadRooms.toString()),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.add_circle_outline,
                                  color: t13_colorPrimary,
                                ),
                                onTap: () {
                                  totalBadRooms = totalBadRooms + 1;
                                  setState(() {});
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      mView,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          mLabel(t13_lbl_bathrooms),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  color: t13_textColorSecondary,
                                ),
                                onTap: () {
                                  if (totalBathRooms == 1 || totalBathRooms < 1) {
                                    totalBathRooms = 1;
                                  } else {
                                    totalBathRooms = totalBathRooms - 1;
                                  }
                                  setState(() {});
                                },
                              ),
                              Container(
                                margin: EdgeInsets.only(left: spacing_middle, right: spacing_middle),
                                child: text(totalBathRooms.toString()),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.add_circle_outline,
                                  color: t13_colorPrimary,
                                ),
                                onTap: () {
                                  totalBathRooms = totalBathRooms + 1;
                                  setState(() {});
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      mView,
                      mLabel(t13_lbl_size),
                      SizedBox(height: spacing_middle),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: t13EditTextStyle(t13_hint_from, isPassword: false, keyboardType: TextInputType.number),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: spacing_standard, right: spacing_standard),
                            child: Icon(Icons.remove),
                          ),
                          Expanded(
                            child: t13EditTextStyle(t13_hint_to, isPassword: false, keyboardType: TextInputType.number),
                          )
                        ],
                      ),
                      SizedBox(height: spacing_large),
                      T13Button(
                          textContent: t13_lbl_update,
                          onPressed: () {
                            finish(context);
                          }),
                      SizedBox(height: spacing_large),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
