import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTDashboardScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTDrawerWidget.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTForgotPwdScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTSignUpScreen.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class DTSignInScreen extends StatefulWidget {
  static String tag = '/DTSignInScreen';

  @override
  DTSignInScreenState createState() => DTSignInScreenState();
}

class DTSignInScreenState extends State<DTSignInScreen> {
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool autoValidate = false;

  var emailCont = TextEditingController();
  var passCont = TextEditingController();

  var passFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(context, 'Sign In'),
      drawer: DTDrawerWidget(),
      body: Center(
        child: Container(
          width: dynamicWidth(context),
          child: Form(
            key: formKey,
           autovalidateMode: AutovalidateMode.onUserInteraction,
           child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Sign In', style: boldTextStyle(size: 24)),
                  30.height,
                  TextFormField(
                    controller: emailCont,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      contentPadding: EdgeInsets.all(16),
                      labelStyle: secondaryTextStyle(),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appColorPrimary)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (s) {
                      if (s!.trim().isEmpty) return errorThisFieldRequired;
                      if (!s.trim().validateEmail()) return 'Email is invalid';
                      return null;
                    },
                    onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(passFocus),
                    textInputAction: TextInputAction.next,
                  ),
                  16.height,
                  TextFormField(
                    obscureText: obscureText,
                    focusNode: passFocus,
                    controller: passCont,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      contentPadding: EdgeInsets.all(16),
                      labelStyle: secondaryTextStyle(),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appColorPrimary)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                      suffix: Icon(!obscureText ? Icons.visibility : Icons.visibility_off).onTap(() {
                        obscureText = !obscureText;
                        setState(() {});
                      }),
                    ),
                    validator: (s) {
                      if (s!.trim().isEmpty) return errorThisFieldRequired;
                      return null;
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      DTForgotPwdScreen().launch(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      alignment: Alignment.topRight,
                      child: Text("Forgot Password?", style: boldTextStyle(color: appColorPrimary)),
                    ),
                  ),
                  16.height,
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(color: appColorPrimary, borderRadius: BorderRadius.circular(8), boxShadow: defaultBoxShadow()),
                    child: Text('Sign In', style: boldTextStyle(color: white, size: 18)),
                  ).onTap(() {
                    finish(context);
                    DTDashboardScreen().launch(context);

                    /// Remove comment if you want enable validation
                    /*if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        DTDashboardScreen().launch(context);
                      } else {
                        autoValidate = true;
                      }
                      setState(() {});*/
                  }),
                  10.height,
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(color: appColorPrimary, borderRadius: BorderRadius.circular(8), boxShadow: defaultBoxShadow()),
                    child: Text('Sign Up', style: boldTextStyle(color: white, size: 18)),
                  ).onTap(() {
                    DTSignUpScreen().launch(context);
                  }),
                  10.height,
                  Text('OR', style: boldTextStyle(size: 22)).center(),
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(color: appColorPrimary, boxShadow: defaultBoxShadow(), shape: BoxShape.circle),
                        child: Icon(MaterialCommunityIcons.google_glass, color: white),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(color: appColorPrimary, boxShadow: defaultBoxShadow(), shape: BoxShape.circle),
                        child: Icon(FontAwesome.facebook, color: white),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(color: appColorPrimary, boxShadow: defaultBoxShadow(), shape: BoxShape.circle),
                        child: Icon(Feather.twitter, color: white),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(color: appColorPrimary, boxShadow: defaultBoxShadow(), shape: BoxShape.circle),
                        child: Icon(Feather.linkedin, color: white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ).center(),
        ),
      ),
    );
  }
}
