import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAColors.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';

class DAChangePasswordScreen extends StatefulWidget {
  @override
  DAChangePasswordScreenState createState() => DAChangePasswordScreenState();
}

class DAChangePasswordScreenState extends State<DAChangePasswordScreen> {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  FocusNode currentPasswordFocus = FocusNode();
  FocusNode newPasswordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Change Password', center: true, titleTextStyle: boldTextStyle()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            AppTextField(
              controller: currentPassword,
              textStyle: primaryTextStyle(color: black),
              focus: currentPasswordFocus,
              nextFocus: newPasswordFocus,
              textFieldType: TextFieldType.PASSWORD,
              cursorColor: white,
              decoration: buildInputDecoration('Your current password'),
            ),
            16.height,
            AppTextField(
              controller: newPassword,
              textStyle: primaryTextStyle(color: black),
              focus: newPasswordFocus,
              nextFocus: confirmPasswordFocus,
              textFieldType: TextFieldType.PASSWORD,
              cursorColor: white,
              decoration: buildInputDecoration('Create a new password'),
            ),
            16.height,
            AppTextField(
              controller: confirmPassword,
              textStyle: primaryTextStyle(color: black),
              focus: confirmPasswordFocus,
              textFieldType: TextFieldType.PASSWORD,
              cursorColor: white,
              decoration: buildInputDecoration('Confirm password'),
            ),
            16.height,
            AppButton(
              text: 'Done',
              textStyle: boldTextStyle(color: white),
              width: context.width(),
              color: primaryColor,
              onTap: () {
               finish(context);
              },
            )
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
