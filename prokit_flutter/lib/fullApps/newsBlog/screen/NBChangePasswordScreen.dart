import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBWidgets.dart';

class NBChangePasswordScreen extends StatefulWidget {
  @override
  _NBChangePasswordScreenState createState() => _NBChangePasswordScreenState();
}

class _NBChangePasswordScreenState extends State<NBChangePasswordScreen> {
  TextEditingController oldPassCont = TextEditingController();
  TextEditingController newPassCont = TextEditingController();
  TextEditingController confirmPassCont = TextEditingController();

  FocusNode oldPassFocus = FocusNode();
  FocusNode newPassFocus = FocusNode();
  FocusNode confirmPassFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: nbAppBarWidget(context, title: 'Change Password'),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              nbAppTextFieldWidget(oldPassCont, 'Old Password', TextFieldType.PASSWORD, focus: oldPassFocus, nextFocus: newPassFocus),
              16.height,
              nbAppTextFieldWidget(newPassCont, 'New Password', TextFieldType.PASSWORD, focus: newPassFocus, nextFocus: confirmPassFocus),
              16.height,
              nbAppTextFieldWidget(confirmPassCont, 'Repeat New Password', TextFieldType.PASSWORD, focus: confirmPassFocus),
              16.height,
              nbAppButtonWidget(context, 'Continue', () {
                toast('Password Changed Successfully');
                finish(context);
              }),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
