import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GrocerySignUp.dart';

class GrocerySuccessfulVerify extends StatefulWidget {
  static String tag = '/GrocerySuccessfulVerify';

  @override
  _GrocerySuccessfulVerifyState createState() => _GrocerySuccessfulVerifyState();
}

class _GrocerySuccessfulVerifyState extends State<GrocerySuccessfulVerify> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(grocery_colorPrimary);
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: grocery_colorPrimary,
      body: Column(
        children: <Widget>[
          SizedBox(height: spacing_xxLarge),
          SizedBox(height: spacing_xxLarge),
          SizedBox(height: spacing_xxLarge),
          commonCacheImageWidget(grocery_logo, width * 0.35, width: width * 0.35, fit: BoxFit.fill).center(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: grocery_color_white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: const Radius.circular(20.0)),
                  boxShadow: <BoxShadow>[BoxShadow(color: grocery_ShadowColor, blurRadius: 20.0, offset: Offset(0.0, 0.9))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(Grocery_ic_CheckMark, height: 45, width: 45, color: grocery_colorPrimary).paddingOnly(left: spacing_standard_new).paddingTop(spacing_large),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text(grocery_lbl_Congratulations, fontSize: textSizeXLarge, fontFamily: fontBold).paddingOnly(
                                top: spacing_standard_new,
                                left: spacing_standard_new,
                                right: spacing_standard_new,
                              ),
                              text(grocery_lbl_Cong_Msg, textColor: grocery_textColorPrimary, isLongText: true).paddingOnly(left: spacing_standard_new, right: spacing_standard),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: spacing_standard_new),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(width: width * 0.35, child: groceryButton1(textContent: grocery_lbl_Later, onPressed: (() {}))),
                        groceryButton(
                          textContent: grocery_lbl_Sign_In,
                          onPressed: (() {
                            GrocerySignUp(isSignIn: true, isSignUp: false).launch(context);
                          }),
                        ).paddingOnly(right: spacing_standard),
                      ],
                    ).paddingOnly(bottom: spacing_standard_new)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
