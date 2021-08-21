import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryHomeDelivery.dart';
import 'GroceryPickupFromOutlet.dart';

class GrocerySelectDeliveryType extends StatefulWidget {
  static String tag = '/GrocerySelectDeliveryType';

  @override
  _GrocerySelectDeliveryTypeState createState() => _GrocerySelectDeliveryTypeState();
}

class _GrocerySelectDeliveryTypeState extends State<GrocerySelectDeliveryType> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_color_white);

    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 68),
        child: title1(grocery_lbl_Select_Delivery_Type, grocery_color_white, grocery_textColorPrimary, context),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: grocery_color_white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: const Radius.circular(20.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(color: grocery_ShadowColor, blurRadius: 20.0, offset: Offset(0.0, 0.9)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: spacing_standard),
              GestureDetector(
                onTap: () {
                  GroceryHomeDelivery().launch(context);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: boxDecoration(radius: 25.0, bgColor: grocery_orangeLight_Color),
                      child: Image.asset(
                        Grocery_ic_Home,
                        height: 10,
                        width: 10,
                        color: grocery_color_white,
                      ).paddingAll(12),
                    ).paddingOnly(top: spacing_control, left: spacing_standard_new, bottom: spacing_standard, right: spacing_standard),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text(grocery_lbl_Home_Delivery, fontSize: textSizeLargeMedium, fontFamily: fontMedium).paddingOnly(left: spacing_standard, right: spacing_standard),
                              text("Within delivery grid", textColor: grocery_textColorSecondary).paddingOnly(left: spacing_standard, right: spacing_standard),
                            ],
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 30,
                            color: grocery_textColorSecondary,
                          ).paddingOnly(right: spacing_standard_new)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  GroceryPickupFromOutlet().launch(context);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: boxDecoration(radius: 25.0, bgColor: grocery_orangeColor),
                      child: Image.asset(
                        Grocery_ic_Home,
                        height: 10,
                        width: 10,
                        color: grocery_color_white,
                      ).paddingAll(12),
                    ).paddingOnly(top: spacing_standard, left: spacing_standard_new, bottom: spacing_control, right: spacing_standard),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text(grocery_lbl_PickUp, fontSize: textSizeLargeMedium, fontFamily: fontMedium).paddingOnly(left: spacing_standard, right: spacing_standard),
                              text(grocery_Only_from_Outlet, textColor: grocery_textColorSecondary, fontSize: textSizeMedium).paddingOnly(left: spacing_standard, right: spacing_standard),
                            ],
                          ),
                          Icon(Icons.keyboard_arrow_right, size: 30, color: grocery_textColorSecondary).paddingOnly(right: spacing_standard_new)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: spacing_standard_new),
            ],
          ),
        ),
      ),
    );
  }
}
