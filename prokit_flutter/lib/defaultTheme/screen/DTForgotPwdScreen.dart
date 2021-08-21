import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'DTDrawerWidget.dart';

class DTForgotPwdScreen extends StatefulWidget {
  static String tag = '/DTForgotPwdScreen';

  @override
  _DTForgotPwdScreenState createState() => _DTForgotPwdScreenState();
}

class _DTForgotPwdScreenState extends State<DTForgotPwdScreen> {
  var emailCont = TextEditingController();
  bool autoValidate = false;
  var formKey = GlobalKey<FormState>();

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
      appBar: appBar(context, 'Forgot Password'),
      drawer: DTDrawerWidget(),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          width: dynamicWidth(context),
          alignment: Alignment.center,
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Password Reset', style: boldTextStyle(size: 24)),
                  Text('To reset your password, enter your email to get reset link.', style: secondaryTextStyle()),
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
                    textInputAction: TextInputAction.done,
                  ),
                  20.height,
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(color: appColorPrimary, borderRadius: BorderRadius.circular(8), boxShadow: defaultBoxShadow()),
                    child: Text('Send', style: boldTextStyle(color: white, size: 18)),
                  ).onTap(() {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      finish(context);
                    } else {
                      autoValidate = true;
                    }
                    setState(() {});
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
