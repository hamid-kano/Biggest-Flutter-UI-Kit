import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingContants.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingStrings.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingWidget.dart';

import 'BankingDashboard.dart';

class BankingForgotPwd extends StatefulWidget {
  static var tag = "/BankingForgotPwd";

  @override
  _BankingForgotPwdState createState() => _BankingForgotPwdState();
}

class _BankingForgotPwdState extends State<BankingForgotPwd> {
  @override
  void initState() {
    setStatusBarColor(Banking_app_Background);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Banking_app_Background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, width * 0.45),
        child: headerView("Forgot\nPassword", width * 0.45, context),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  Banking_lbl_Walk1SubTitle,
                  style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontSemiBold),
                ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                16.height,
                EditText(text: "New Password", isPassword: true, isSecure: true).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                8.height,
                EditText(text: "Confirm Password", isPassword: true, isSecure: true).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                16.height,
                BankingButton(
                  textContent: Banking_lbl_SignIn,
                  onPressed: () {
                    BankingDashboard().launch(context);
                  },
                ).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              Banking_lbl_app_Name.toUpperCase(),
              style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16, fontFamily: fontRegular),
            ).paddingOnly(bottom: spacing_standard_new),
          ),
        ],
      ),
    );
  }
}
