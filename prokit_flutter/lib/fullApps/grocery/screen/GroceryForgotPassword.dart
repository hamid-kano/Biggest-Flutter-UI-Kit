import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryVerifyNumber.dart';

class GroceryForgotPassword extends StatefulWidget {
  static String tag = '/GroceryForgotPassword';

  @override
  _GroceryForgotPasswordState createState() => _GroceryForgotPasswordState();
}

class _GroceryForgotPasswordState extends State<GroceryForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_colorPrimary);

    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: title(grocery_lbl_Forgot_password, grocery_colorPrimary, grocery_color_white, context),
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
              text(grocery_lbl_Reset_Password, fontSize: textSizeLarge, fontFamily: fontBold).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              text(
                grocery_lbl_enter_email_for_reset_password,
                textColor: grocery_textColorSecondary,
                fontSize: textSizeLargeMedium,
              ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
              SizedBox(height: spacing_standard_new),
              EditText(
                text: grocery_lbl_Email_Address,
                isPassword: false,
                keyboardType: TextInputType.emailAddress,
              ).paddingAll(spacing_standard_new),
              Align(
                alignment: Alignment.centerRight,
                child: FittedBox(
                  child: groceryButton(
                    textContent: grocery_lbl_send,
                    onPressed: (() {
                      GroceryVerifyNumber().launch(context);
                    }),
                  ).paddingOnly(right: spacing_standard_new, bottom: spacing_standard_new),
                ).paddingOnly(top: spacing_standard_new, bottom: spacing_standard_new),
              )
            ],
          ),
        ),
      ),
    );
  }
}
