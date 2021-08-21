import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingContants.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingStrings.dart';

class BankingTermsCondition extends StatefulWidget {
  static var tag = "/BankingTermsCondition";

  @override
  _BankingTermsConditionState createState() => _BankingTermsConditionState();
}

class _BankingTermsConditionState extends State<BankingTermsCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Banking_app_Background,
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.chevron_left, size: 30, color: Banking_blackColor).onTap(
                    () {
                      finish(context);
                    },
                  ),
                  30.height,
                  Text(Banking_lbl_Term_Conditions, style: boldTextStyle(size: 30, color: Banking_TextColorPrimary)),
                ],
              ),
              20.height,
              UL(
                symbolColor: Banking_Primary,
                children: List.generate(
                  8,
                  (index) => Text(
                    Banking_lbl_Walk1SubTitle,
                    style: primaryTextStyle(size: 16, fontFamily: fontRegular),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
