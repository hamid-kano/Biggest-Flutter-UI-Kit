import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';

class GroceryRecipientDetail extends StatefulWidget {
  static String tag = '/GroceryRecipientDetail';

  @override
  _GroceryRecipientDetailState createState() => _GroceryRecipientDetailState();
}

class _GroceryRecipientDetailState extends State<GroceryRecipientDetail> {
  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_color_white);
    return Scaffold(
      backgroundColor: grocery_app_background,
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
              title1(grocery_lbl_Recipient_Details, grocery_color_white, grocery_textColorPrimary, context),
              Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      CachedNetworkImage(
                        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                        imageUrl: Grocery_ic_Profile,
                        height: 70,
                        width: 70,
                        fit: BoxFit.fill,
                      ).cornerRadiusWithClipRRect(40.0).paddingOnly(left: spacing_standard_new, top: spacing_standard_new),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: boxDecoration(radius: 40.0, bgColor: grocery_textColorPrimary.withOpacity(0.4)),
                        child: Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: grocery_color_white,
                        ).center(),
                      ).paddingOnly(left: spacing_standard_new, top: spacing_standard_new)
                    ],
                  ),
                  text("Change image", textColor: grocery_textColorSecondary, fontSize: textSizeLargeMedium, fontFamily: fontMedium)
                      .paddingOnly(
                        left: spacing_standard_new,
                      )
                      .onTap(() {})
                ],
              ),
              SizedBox(
                height: spacing_standard,
              ),
              EditText(
                text: "Ishan Maduskha",
                isPassword: false,
              ).paddingAll(spacing_standard_new),
              EditText(
                text: "ish.maduskha@gmail.com",
                isPassword: false,
                keyboardType: TextInputType.emailAddress,
              ).paddingAll(spacing_standard_new),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CountryCodePicker(onChanged: print),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                            color: grocery_textColorSecondary,
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        width: width * 0.22,
                        decoration: boxDecoration(bgColor: grocery_textColorSecondary.withOpacity(0.5), radius: 10.0),
                      ).paddingOnly(left: spacing_standard_new)
                    ],
                  ),
                  Expanded(
                    child: EditText(text: "71 878 6729", isPassword: false, keyboardType: TextInputType.number).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                  )
                ],
              ).paddingOnly(top: spacing_standard_new),
              SizedBox(height: spacing_standard_new),
              Align(
                alignment: Alignment.centerRight,
                child: FittedBox(
                  child: groceryButton(
                    textContent: grocery_lbl_Save,
                    color: grocery_colorPrimary,
                    onPressed: (() {}),
                  ).paddingOnly(right: spacing_standard_new, bottom: spacing_standard_new).paddingOnly(top: spacing_standard_new, bottom: spacing_standard_new),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
