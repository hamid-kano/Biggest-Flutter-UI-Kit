import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_colors.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_constant.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_widget.dart';

import '../../../main.dart';

class T12SignUp extends StatefulWidget {
  static String tag = '/T12SignUp';

  @override
  T12SignUpState createState() => T12SignUpState();
}

class T12SignUpState extends State<T12SignUp> {
  FocusNode phoneNumberFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? phone;
  String? name;
  String? password;
  bool autoValidate = false;
  bool passwordVisible = false;
  bool isLoading = false;
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: SingleChildScrollView(
                child: Container(
                  decoration: boxDecoration(radius: spacing_standard, showShadow: true, bgColor: appStore.scaffoldBackground),
                  margin: EdgeInsets.all(spacing_standard_new),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      themeLogo().paddingOnly(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new, top: spacing_standard_new),
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            formField(context, "Your Name", prefixIcon: Icons.person_outline, focusNode: nameFocus, textInputAction: TextInputAction.next, nextFocus: phoneNumberFocus,
                                onSaved: (String? value) {
                              setState(() {
                                name = value;
                              });
                            }).paddingBottom(spacing_standard_new),
                            formField(context, "Phone Number", prefixIcon: Icons.phone_iphone, focusNode: phoneNumberFocus, textInputAction: TextInputAction.next, nextFocus: passwordFocus,
                                onSaved: (String? value) {
                              setState(() {
                                phone = value;
                              });
                            }).paddingBottom(spacing_standard_new),
                            formField(context, "Password",
                                prefixIcon: Icons.lock_outline,
                                isPassword: true,
                                isPasswordVisible: passwordVisible,
                                validator: (value) {
                                  return value!.isEmpty ? "Password Required" : null;
                                },
                                focusNode: passwordFocus,
                                onSaved: (String? value) {
                                  password = value;
                                },
                                textInputAction: TextInputAction.done,
                                suffixIconSelector: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                suffixIcon: passwordVisible ? Icons.visibility : Icons.visibility_off),
                          ],
                        ),
                      ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 14,
                            height: 14,
                            decoration: boxDecoration(bgColor: isRemember ? t12_primary_color : Colors.transparent, color: isRemember ? t12_primary_color : t12_text_secondary),
                            child: Icon(Icons.done, color: Colors.white, size: 14).visible(isRemember),
                          ).onTap(() {
                            setState(() {
                              isRemember = !isRemember;
                            });
                          }).paddingRight(spacing_middle),
                          Expanded(child: text("I agree to the Terms & conditions and Privacy Policy", textColor: appStore.textSecondaryColor, fontSize: textSizeMedium, maxLine: 2))
                        ],
                      ).paddingOnly(left: 18, right: spacing_standard_new, top: spacing_standard_new),
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          padding: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
                          child: text("Register", textColor: Colors.white, fontFamily: fontMedium),
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(spacing_standard)),
                          color: t12_primary_color,
                          onPressed: () => {},
                        ),
                      ).paddingAll(spacing_standard_new),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          text("Have an account?", fontSize: textSizeMedium),
                          text("Login", fontSize: textSizeMedium, textColor: t12_primary_color, fontFamily: fontMedium).paddingLeft(spacing_control),
                        ],
                      ).onTap(() {}).paddingBottom(spacing_standard_new)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              child: appBar(context, "Register"),
            )
          ],
        ),
      ),
    );
  }
}
