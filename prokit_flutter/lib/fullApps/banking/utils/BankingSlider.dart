import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/model/BankingModel.dart';

import 'BankingColors.dart';
import 'BankingContants.dart';
import 'BankingDataGenerator.dart';
import 'BankingImages.dart';
import 'BankingStrings.dart';

class BankingSliderWidget extends StatefulWidget {
  static String tag = '/BankingSlider';

  @override
  BankingSliderWidgetState createState() => BankingSliderWidgetState();
}

class BankingSliderWidgetState extends State<BankingSliderWidget> {
  var currentIndexPage = 0;
  late List<BankingCardModel> mList;

  @override
  void initState() {
    super.initState();
    mList = bankingCardList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mList.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 8, right: 16),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 320,
                child: Stack(
                  children: [
                    Container(height: 200, width: 320, child: Image.asset(Banking_ic_CardImage, fit: BoxFit.fill)),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          24.height,
                          Row(
                            children: [
                              Text(mList[currentIndexPage].name.validate(), style: primaryTextStyle(color: Banking_whitePureColor, size: 18, fontFamily: fontMedium)).expand(),
                              Text(Banking_lbl_app_Name, style: primaryTextStyle(color: Banking_whitePureColor, size: 16, fontFamily: fontMedium))
                            ],
                          ),
                          24.height,
                          Text(mList[currentIndexPage].bank.validate(), style: primaryTextStyle(color: Banking_whitePureColor, size: 18, fontFamily: fontMedium)),
                          4.height,
                          Text('1121 *** ** *** 5555', style: primaryTextStyle(color: Banking_whitePureColor, size: 18, fontFamily: fontMedium)),
                          8.height,
                          Text("\$" + mList[currentIndexPage].rs.validate(), style: primaryTextStyle(color: Banking_whitePureColor, size: 18, fontFamily: fontMedium)),
                        ],
                      ),
                    ),
                    10.height,
                  ],
                ).paddingRight(16),
              );
            },
          ),
        ),
        16.height,
        DotsIndicator(
          dotsCount: mList.length,
          position: currentIndexPage.toDouble(),
          decorator: DotsDecorator(
            size: const Size.square(5.0),
            activeSize: const Size.square(8.0),
            color: Banking_greyColor,
            activeColor: Banking_blackColor,
          ),
        )
      ],
    );
  }
}
