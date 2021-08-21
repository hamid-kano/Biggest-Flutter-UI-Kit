import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_home_screen.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_app_widgets.dart';

import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_size.dart';
import 'package:nb_utils/nb_utils.dart';

class ChangePasswordScreen extends StatefulWidget {
  static String tag = '/ChangePasswordScreen';

  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  FocusNode passFocus = FocusNode();
  FocusNode newPassFocus = FocusNode();
  FocusNode newConfirmPassFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? password;
  String? newPassword;
  bool autoValidate = false;
  bool passwordVisible = false;
  bool isLoading = false;

  showLoading(bool show) {
    setState(() {
      isLoading = show;
    });
  }

  @override
  Widget build(BuildContext context) {
    var form = Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          formField(
            context,
            "Old Password",
            isPassword: true,
            isPasswordVisible: passwordVisible,
            validator: (value) {
              return value!.isEmpty ? "Password Required" : null;
            },
            focusNode: passFocus,
            nextFocus: newPassFocus,
            onSaved: (String? value) {
              password = value;
            },
            textInputAction: TextInputAction.next,
            suffixIconSelector: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            suffixIcon: passwordVisible ? Icons.visibility : Icons.visibility_off,
          ).paddingBottom(spacing_standard_new),
          formField(
            context,
            "New Password",
            isPassword: true,
            isPasswordVisible: passwordVisible,
            validator: (value) {
              return value!.isEmpty ? "Password Required" : null;
            },
            focusNode: newPassFocus,
            nextFocus: newConfirmPassFocus,
            onSaved: (String? value) {
              newPassword = value;
            },
            textInputAction: TextInputAction.next,
            suffixIconSelector: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            suffixIcon: passwordVisible ? Icons.visibility : Icons.visibility_off,
          ).paddingBottom(spacing_standard_new),
          formField(
            context,
            "Confirm New Password",
            isPassword: true,
            isPasswordVisible: passwordVisible,
            validator: (value) {
              return value!.isEmpty ? "Password Required" : null;
            },
            focusNode: newConfirmPassFocus,
            onSaved: (String? value) {
              newPassword = value;
            },
            textInputAction: TextInputAction.done,
            suffixIconSelector: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            suffixIcon: passwordVisible ? Icons.visibility : Icons.visibility_off,
          ).paddingBottom(spacing_standard_new),
        ],
      ),
    );
    var signinButton = SizedBox(
      width: double.infinity,
      child: button(context, "Save", () {
        /*  final form = _formKey.currentState;
        if (form.validate()) {
          form.save();
          doSignIn(context);
        } else {
          setState(() => _autoValidate = true);
        }*/
        doSignIn(context);
      }),
    );

    return Scaffold(
      backgroundColor: muvi_appBackground,
      appBar: appBarLayout(context, "Change Password", darkBackground: false),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                form.paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: spacing_large).paddingBottom(spacing_standard_new),
                signinButton.paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
              ],
            ),
          ),
          Center(child: loadingWidgetMaker().visible(isLoading))
        ],
      ),
    );
  }

  onForgotPasswordClicked(context) {}

  doSignIn(context) {
    HomeScreen().launch(context);
  }
}
