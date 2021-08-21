import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_home_screen.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_signup.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_constants.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_images.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_size.dart';

class SignInScreen extends StatefulWidget {
  static String tag = '/SignInScreen';

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  FocusNode passFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
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
            "Email",
            maxLine: 1,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (!value.validateEmail()) return "Enter valid email";
              return null;
            },
            onSaved: (String? value) {
              email = value;
            },
            textInputAction: TextInputAction.next,
            focusNode: emailFocus,
            nextFocus: passFocus,
            suffixIcon: Icons.mail_outline,
          ).paddingBottom(spacing_standard_new),
          formField(
            context,
            "Password",
            isPassword: true,
            isPasswordVisible: passwordVisible,
            validator: (value) {
              return value!.isEmpty ? "Password Required" : null;
            },
            focusNode: passFocus,
            onSaved: (String? value) {
              password = value;
            },
            textInputAction: TextInputAction.done,
            suffixIconSelector: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            suffixIcon: passwordVisible ? Icons.visibility : Icons.visibility_off,
          )
        ],
      ),
    );
    var signinButton = SizedBox(
      width: double.infinity,
      child: button(context, "Get Started", () {
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
    var loginWithGoogle = iconButton(context, "Login with Google", ic_google, () {}, backgroundColor: Colors.white).paddingOnly(left: spacing_standard_new, right: spacing_standard_new);

    return Scaffold(
      backgroundColor: muvi_appBackground,
      appBar: appBarLayout(context, "Login", darkBackground: false),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Align(alignment: Alignment.center, child: flixTitle(context).paddingAll(spacing_large)),
                text("Please Login to enjoy more benefits and we won't let you go", fontSize: ts_normal, textColor: muvi_textColorPrimary, maxLine: 2, isCentered: true)
                    .paddingOnly(top: spacing_control, left: spacing_large, right: spacing_large),
                form.paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: spacing_large),
                text("Forgot Password", fontSize: ts_medium, textColor: muvi_colorPrimary).paddingAll(spacing_standard_new).onTap(() {
                  onForgotPasswordClicked(context);
                }),
                signinButton.paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                Align(alignment: Alignment.center, child: text("Or simply login with", fontSize: ts_medium).paddingAll(spacing_standard_new)),
                loginWithGoogle..paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(spacing_standard_new),
            height: double.infinity,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  text("Don't have an account?", fontSize: ts_medium, textColor: muvi_textColorPrimary).paddingAll(spacing_control),
                  text("Register", fontSize: ts_medium, fontFamily: font_medium, textColor: muvi_colorPrimary).paddingAll(spacing_control).onTap(() {
                    SignUpScreen().launch(context);
                  })
                ],
              ),
            ),
          ),
          Center(child: loadingWidgetMaker().visible(isLoading))
        ],
      ),
    );
  }

  onForgotPasswordClicked(context) {}

  doSignIn(context) {
    finish(context);
    HomeScreen().launch(context);
  }
}
