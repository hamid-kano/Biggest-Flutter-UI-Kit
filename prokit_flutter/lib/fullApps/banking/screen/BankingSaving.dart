import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/model/BankingModel.dart';
import 'package:prokit_flutter/fullApps/banking/screen/BankingAddNewSaving.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingContants.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingDataGenerator.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingImages.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingStrings.dart';

class BankingSaving extends StatefulWidget {
  static var tag = "/BankingSaving";

  @override
  _BankingSavingState createState() => _BankingSavingState();
}

class _BankingSavingState extends State<BankingSaving> {
  late List<BankingSavingModel> savingList;

  @override
  void initState() {
    super.initState();
    savingList = bankingSavingList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Banking_app_Background,
      body: Container(
        padding: EdgeInsets.all(12),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 60),
              height: context.height(),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.height,
                    Text(Banking_lbl_Saving_Online, style: boldTextStyle(color: Banking_TextColorPrimary, size: 35)),
                    30.height,
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        BankingSavingModel data = savingList[index % savingList.length];
                        return Container(
                          margin: EdgeInsets.only(top: 8, bottom: 8),
                          padding: EdgeInsets.all(8),
                          decoration: boxDecorationWithShadow(backgroundColor: Banking_whitePureColor, boxShadow: defaultBoxShadow(), borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Banking_palColor),
                                padding: EdgeInsets.all(16),
                                child: Image.asset(Banking_ic_piggyBank, height: 20, width: 20, fit: BoxFit.fill),
                              ).center(),
                              10.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data.title!, style: primaryTextStyle(color: Banking_TextColorPrimary, size: 18, fontFamily: fontMedium)),
                                  8.height,
                                  Text(data.rs!, style: primaryTextStyle(color: Banking_TextColorSecondary, size: 18)),
                                  2.height,
                                  Text(data.interest!, style: primaryTextStyle(color: Banking_TextColorSecondary, size: 18)),
                                ],
                              ).expand(),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(data.date!, style: primaryTextStyle(color: Banking_TextColorSecondary, size: 16)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 60,
                width: context.width(),
                padding: EdgeInsets.all(8),
                decoration: boxDecorationWithShadow(backgroundColor: Banking_whitePureColor, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Banking_palColor),
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.add, size: 20, color: Banking_whitePureColor),
                    ).center(),
                    10.width,
                    Text("Add New Savings", style: primaryTextStyle(color: Banking_TextColorPrimary, size: 18, fontFamily: fontMedium)).expand(),
                  ],
                ),
              ).onTap(() {
                BankingAddNewSaving().launch(context);
              }),
            )
          ],
        ),
      ),
    );
  }
}
