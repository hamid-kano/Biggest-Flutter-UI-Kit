import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';
import 'DTDrawerWidget.dart';

class DTSignUpScreen extends StatefulWidget {
  static String tag = '/DTSignUpScreen';

  @override
  DTSignUpScreenState createState() => DTSignUpScreenState();
}

class DTSignUpScreenState extends State<DTSignUpScreen> {
  bool obscureText = true;
  bool autoValidate = false;
  var formKey = GlobalKey<FormState>();

  var emailCont = TextEditingController();
  var passCont = TextEditingController();
  var nameCont = TextEditingController();

  var emailFocus = FocusNode();
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
      appBar: appBar(context, 'Sign Up'),
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
                  Text('Sign Up', style: boldTextStyle(size: 24)),
                  30.height,
                  TextFormField(
                    controller: nameCont,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      labelText: 'Name',
                      contentPadding: EdgeInsets.all(16),
                      labelStyle: secondaryTextStyle(),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appColorPrimary)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (s) {
                      if (s!.trim().isEmpty) return errorThisFieldRequired;
                      return null;
                    },
                    onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(emailFocus),
                    textInputAction: TextInputAction.next,
                  ),
                  16.height,
                  TextFormField(
                    controller: emailCont,
                    focusNode: emailFocus,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: secondaryTextStyle(),
                      contentPadding: EdgeInsets.all(16),
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
                  20.height,
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(color: appColorPrimary, borderRadius: BorderRadius.circular(8), boxShadow: defaultBoxShadow()),
                    child: Text('Sign Up', style: boldTextStyle(color: white, size: 18)),
                  ).onTap(() {
                    finish(context);

                    /// Remove comment if you want enable validation
                    /* if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        finish(context);
                      } else {
                        autoValidate = true;
                      }
                      setState(() {});*/
                  }),
                  20.height,
                  Text('Already Registered?', style: boldTextStyle(color: appColorPrimary)).center().onTap(() {
                    finish(context);
                  }),
                ],
              ),
            ),
          ).center(),
        ),
      ),
    );
  }
}
