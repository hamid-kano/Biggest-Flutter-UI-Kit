import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryTermCondition extends StatefulWidget {
  static String tag = '/GroceryTermCondition';

  @override
  _GroceryTermConditionState createState() => _GroceryTermConditionState();
}

class _GroceryTermConditionState extends State<GroceryTermCondition> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_colorPrimary);

    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: title1(grocery_lbl_Terms_and_Condition, grocery_colorPrimary, grocery_color_white, context),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Product Terms",
                style: boldTextStyle(color: grocery_textColorPrimary, size: 16),
              ).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              Text(grocery_lbl_Long_text, style: secondaryTextStyle(color: grocery_textColorPrimary, size: 16))
                  .paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              SizedBox(height: spacing_large),
              Text(
                "1. Use of the site",
                style: boldTextStyle(color: grocery_textColorPrimary, size: 16),
              ).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              Text(grocery_lbl_Long_text, style: secondaryTextStyle(color: grocery_textColorPrimary, size: 16))
                  .paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              SizedBox(height: spacing_standard_new),
              Text("THESE TERMS AND CONDITIONS DO NOT AFFECT YOUR STATUTORY RIGHTS", style: boldTextStyle(color: grocery_textColorPrimary, size: 16))
                  .paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              SizedBox(height: spacing_standard_new),
              Text(
                "2. Amendments",
                style: boldTextStyle(color: grocery_textColorPrimary, size: 16),
              ).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              Text("we may revise the terms and conditions from time to time without notice to you. Lorem ipsum dolor sit.", style: boldTextStyle(color: grocery_textColorPrimary, size: 16))
                  .paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
            ],
          ),
        ),
      ),
    );
  }
}
