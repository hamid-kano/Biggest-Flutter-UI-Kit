import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/model/BankingModel.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingContants.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingDataGenerator.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingStrings.dart';

class BankingNews extends StatefulWidget {
  static var tag = "/BankingNews";

  @override
  _BankingNewsState createState() => _BankingNewsState();
}

class _BankingNewsState extends State<BankingNews> {
  late List<BankingShareInfoModel> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = bankingNewsList();
  }

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
                  Text(Banking_lbl_News, style: boldTextStyle(size: 30, color: Banking_TextColorPrimary)),
                ],
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList1.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => Container(
                  margin: EdgeInsets.only(bottom: 32),
                  decoration: boxDecorationWithShadow(boxShadow: defaultBoxShadow(), backgroundColor: Banking_whitePureColor, borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Text('Cy Captial bank give a giftbox for new customers\nwho create account', style: primaryTextStyle(size: 16, fontFamily: fontRegular)),
                      Image.asset(mList1[index].icon, height: 150, width: 150, fit: BoxFit.cover),
                      Text(Banking_lbl_Walk1SubTitle, style: primaryTextStyle(size: 16, fontFamily: fontRegular)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
