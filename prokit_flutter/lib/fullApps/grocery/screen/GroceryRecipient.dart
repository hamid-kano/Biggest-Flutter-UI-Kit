import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';

class GroceryRecipient extends StatefulWidget {
  static String tag = '/GroceryRecipient';

  @override
  _GroceryRecipientState createState() => _GroceryRecipientState();
}

class _GroceryRecipientState extends State<GroceryRecipient> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_color_white);
    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 68),
        child: title1(grocery_lbl_Recipient_Details, grocery_color_white, grocery_textColorPrimary, context),
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
              Row(
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
                  ).paddingOnly(top: spacing_control, left: spacing_standard_new, bottom: spacing_control),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text("Enter recipient", textColor: grocery_textColorPrimary, fontSize: textSizeLarge, fontFamily: fontMedium).paddingOnly(
                        left: spacing_standard,
                        right: spacing_standard,
                      ),
                      text(
                        "one who receives shopping items",
                        textColor: grocery_textColorSecondary,
                      ).paddingOnly(
                        left: spacing_standard,
                        right: spacing_standard,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: spacing_standard,
              ),
              EditText(
                text: "Ishan Maduskha",
                fontSize: textSizeLargeMedium,
                isPassword: false,
              ).paddingAll(spacing_standard_new),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CountryCodePicker(onChanged: print),
                          Icon(Icons.arrow_drop_down, size: 30, color: grocery_textColorSecondary),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: width * 0.22,
                        decoration: boxDecoration(bgColor: grocery_textColorSecondary.withOpacity(0.5)),
                      ).paddingOnly(left: spacing_standard_new)
                    ],
                  ),
                  Expanded(
                    child: EditText(text: "71 878 6729", isPassword: false, keyboardType: TextInputType.number).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                  )
                ],
              ).paddingOnly(top: spacing_standard_new),
              SizedBox(
                height: spacing_standard_new,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  groceryButton1(textContent: grocery_lbl_Save, onPressed: () {}).paddingOnly(right: spacing_standard, bottom: spacing_standard_new),
                  FittedBox(
                    child: groceryButton(
                      textContent: grocery_lbl_Next,
                      color: grocery_colorPrimary,
                      onPressed: (() {}),
                    ).paddingOnly(right: spacing_standard_new, bottom: spacing_standard_new),
                  ).paddingOnly(top: spacing_standard_new, bottom: spacing_standard_new)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
