import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryPickupFromOutlet extends StatefulWidget {
  static String tag = '/GroceryPickupFromOutlet';

  @override
  _GroceryPickupFromOutletState createState() => _GroceryPickupFromOutletState();
}

class _GroceryPickupFromOutletState extends State<GroceryPickupFromOutlet> {
  String? selectedLocation1 = "Pannipitiya";

  List<String> location1 = ["Pannipitiya"];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_color_white);

    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 75),
        child: title(grocery_lbl_PickUp, grocery_color_white, grocery_textColorPrimary, context),
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
              boxShadow: <BoxShadow>[BoxShadow(color: grocery_ShadowColor, blurRadius: 20.0, offset: Offset(0.0, 0.9))]),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: spacing_standard,
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: boxDecoration(radius: 30.0, bgColor: grocery_orangeLight_Color),
                    child: Image.asset(
                      Grocery_ic_bag,
                      height: 10,
                      width: 10,
                      color: grocery_color_white,
                    ).paddingAll(spacing_standard_new),
                  ).paddingOnly(top: spacing_control, left: spacing_standard_new, bottom: spacing_control),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(grocery_lbl_Pickup_from_outlet, fontSize: textSizeLarge, fontFamily: fontMedium).paddingOnly(left: spacing_standard, right: spacing_standard, bottom: spacing_control),
                      text(
                        grocery_Only_from_Outlet,
                        textColor: grocery_textColorSecondary,
                      ).paddingOnly(
                        left: spacing_standard,
                        right: spacing_standard,
                      ),
                    ],
                  )
                ],
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    DropdownButton(
                      isExpanded: true,
                      value: selectedLocation1,
                      underline: Container(
                        height: 0,
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                      ),
                      style: TextStyle(color: grocery_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLocation1 = newValue;
                        });
                      },
                      items: location1.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      itemHeight: 50,
                    ),
                    Divider(
                      height: 20,
                    ),
                  ],
                ),
              ).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              TextField(
                cursorColor: grocery_colorPrimary,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 8, 4, 8),
                  hintText: "12 April 2020",
                  suffixIcon: Icon(
                    Icons.date_range,
                    color: grocery_icon_color,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: grocery_view_color, width: 0.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: grocery_view_color, width: 0.0),
                  ),
                ),
                style: TextStyle(fontSize: textSizeMedium, color: grocery_textColorPrimary, fontFamily: fontRegular),
              ).paddingAll(spacing_standard_new),
              TextField(
                cursorColor: grocery_colorPrimary,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 8, 4, 8),
                  hintText: "9:30 AM - 10:00 AM",
                  suffixIcon: Icon(
                    Icons.access_time,
                    color: grocery_icon_color,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: grocery_view_color, width: 0.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: grocery_view_color, width: 0.0),
                  ),
                ),
                style: TextStyle(fontSize: textSizeMedium, color: grocery_textColorPrimary, fontFamily: fontRegular),
              ).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              SizedBox(
                height: spacing_large,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      width: width * 0.3,
                      child: groceryButton1(
                        textContent: grocery_lbl_Save,
                        onPressed: (() {}),
                      )),
                  groceryButton(
                    textContent: grocery_lbl_Next,
                    height: 50,
                    onPressed: (() {}),
                  ).paddingOnly(right: spacing_standard),
                ],
              ).paddingOnly(bottom: spacing_standard_new),
              SizedBox(
                height: spacing_large,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
