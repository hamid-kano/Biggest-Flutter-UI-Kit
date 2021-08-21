import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/screen/BankingForgotPwd.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingContants.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingStrings.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingWidget.dart';

class BankingResend extends StatefulWidget {
  static var tag = "/BankingResend";

  @override
  _BankingResendState createState() => _BankingResendState();
}

class _BankingResendState extends State<BankingResend> {
  @override
  void initState() {
    super.initState();
    setStatusBarColor(Banking_app_Background);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Banking_app_Background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, width * 0.45),
        child: headerView("Frogot\nPassword", width * 0.45, context),
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
                8.height,
                EditText(text: "Phone", isPassword: false).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                16.height,
                BankingButton(
                  textContent: Banking_lbl_Next,
                  onPressed: () {
                    BankingForgotPwd().launch(context);
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
