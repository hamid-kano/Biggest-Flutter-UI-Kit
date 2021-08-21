import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryAddNumber.dart';
import 'GroceryDashboard.dart';
import 'GroceryForgotPassword.dart';

// ignore: must_be_immutable
class GrocerySignUp extends StatefulWidget {
  static String tag = '/GrocerySignUp';
  bool? isSignIn;
  bool? isSignUp;

  GrocerySignUp({this.isSignIn, this.isSignUp});

  @override
  _GrocerySignUpState createState() => _GrocerySignUpState();
}

class _GrocerySignUpState extends State<GrocerySignUp> {
  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_color_white);

    final signIn = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text(grocery_lbl_sigIn_App, fontSize: textSizeLarge, fontFamily: fontBold).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
          text(
            grocery_lbl_Enter_email_password_to_continue,
            textColor: grocery_textColorSecondary,
            fontSize: textSizeLargeMedium,
          ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
          EditText(
            text: grocery_lbl_Email_Address,
            isPassword: false,
            keyboardType: TextInputType.emailAddress,
          ).paddingAll(spacing_standard_new),
          EditText(
            text: grocery_lbl_Password,
            isPassword: true,
          ).paddingAll(spacing_standard_new),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              text(
                "$grocery_lbl_Forgot_password?",
                fontSize: textSizeLargeMedium,
                fontFamily: fontMedium,
              ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new).onTap(() {
                GroceryForgotPassword().launch(context);
              }),
              groceryButton(
                textContent: grocery_lbl_Sign_In,
                onPressed: (() {
                  GroceryDashBoardScreen().launch(context);
                }),
              ).paddingOnly(right: spacing_standard_new, bottom: spacing_standard_new).paddingOnly(top: spacing_standard_new, bottom: spacing_standard_new)
            ],
          )
        ],
      ),
    );

    final signUp = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text(grocery_lbl_Welcome_app, fontSize: textSizeLarge, fontFamily: fontBold).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
          text(grocery_lbl_let_Started, textColor: grocery_textColorSecondary, fontSize: textSizeLargeMedium, fontFamily: fontRegular)
              .paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
          EditText(
            text: grocery_lbl_UserName,
            isPassword: false,
          ).paddingAll(spacing_standard_new),
          EditText(
            text: grocery_lbl_Email_Address,
            isPassword: false,
            keyboardType: TextInputType.emailAddress,
          ).paddingAll(spacing_standard_new),
          EditText(
            text: grocery_lbl_Password,
            isPassword: true,
          ).paddingAll(spacing_standard_new),
          Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              child: groceryButton(
                textContent: grocery_lbl_Next,
                onPressed: (() {
                  GroceryAddNumber().launch(context);
                }),
              ).paddingOnly(right: spacing_standard_new, bottom: spacing_standard_new),
            ).paddingOnly(top: spacing_standard_new, bottom: spacing_standard_new),
          )
        ],
      ),
    );

    return Scaffold(
      backgroundColor: grocery_app_background,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: spacing_large,
            ),
            Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text("Sign In", textColor: widget.isSignIn == true ? grocery_textGreenColor : grocery_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontBold)
                          .paddingAll(spacing_standard_new)
                          .onTap(() {
                        widget.isSignIn = true;
                        widget.isSignUp = false;
                        setState(() {});
                      }),
                      text("Sign Up", textColor: widget.isSignUp == true ? grocery_textGreenColor : grocery_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontBold)
                          .paddingAll(spacing_standard_new)
                          .onTap(() {
                        widget.isSignIn = false;
                        widget.isSignUp = true;
                        setState(() {});
                      })
                    ],
                  ),
                  widget.isSignUp! ? signUp : signIn
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
