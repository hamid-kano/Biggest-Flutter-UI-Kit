import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/model/BankingModel.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingContants.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingDataGenerator.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingImages.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingWidget.dart';

class BankingHome1 extends StatefulWidget {
  static String tag = '/BankingHome1';

  @override
  BankingHome1State createState() => BankingHome1State();
}

class BankingHome1State extends State<BankingHome1> {
  int currentIndexPage = 0;
  int? pageLength;

  late List<BankingHomeModel> mList1;
  late List<BankingHomeModel2> mList2;

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
    pageLength = 3;
    mList1 = bankingHomeList1();
    mList2 = bankingHomeList2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 330,
              floating: false,
              pinned: true,
              titleSpacing: 0,
              automaticallyImplyLeading: false,
              backgroundColor: innerBoxIsScrolled ? Banking_Primary : Banking_app_Background,
              actionsIconTheme: IconThemeData(opacity: 0.0),
              title: Container(
                padding: EdgeInsets.fromLTRB(16, 42, 16, 32),
                margin: EdgeInsets.only(bottom: 8, top: 8),
                child: Row(
                  children: [
                    CircleAvatar(backgroundImage: AssetImage(Banking_ic_user1), radius: 24),
                    10.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Hello,Laura", style: primaryTextStyle(color: Banking_TextColorWhite, size: 16, fontFamily: fontRegular)),
                        Text("How are you today?", style: primaryTextStyle(color: Banking_TextColorWhite, size: 16, fontFamily: fontRegular)),
                      ],
                    ).expand(),
                    Icon(Icons.notifications, size: 30, color: Banking_whitePureColor)
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topLeft, colors: <Color>[Banking_Primary, Banking_palColor]),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 80, 16, 8),
                      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                      decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(10), boxShadow: defaultBoxShadow()),
                      child: Column(
                        children: [
                          Container(
                            height: 130,
                            child: PageView(
                              children: [
                                TopCard(name: "Default Account", acno: "1234567899", bal: "\$12,500"),
                                TopCard(name: "Adam Johnson", acno: "9874563210", bal: "\$18,000"),
                                TopCard(name: "Ana Willson", acno: "5821479630", bal: "\$12,500"),
                              ],
                              onPageChanged: (value) {
                                setState(() => currentIndexPage = value);
                              },
                            ),
                          ),
                          8.height,
                          Align(
                            alignment: Alignment.center,
                            child: DotsIndicator(
                              dotsCount: 3,
                              position: currentIndexPage.toDouble(),
                              decorator: DotsDecorator(
                                size: Size.square(8.0),
                                activeSize: Size.square(8.0),
                                color: Banking_view_color,
                                activeColor: Banking_TextColorPrimary,
                              ),
                            ),
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                decoration: boxDecorationWithRoundedCorners(backgroundColor: Banking_Primary, borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.payment, color: Banking_TextColorWhite, size: 24),
                                    10.width,
                                    Text('Payment', style: primaryTextStyle(size: 16, color: Banking_TextColorWhite)),
                                  ],
                                ),
                              ).expand(),
                              10.width,
                              Container(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                decoration: boxDecorationWithRoundedCorners(backgroundColor: Banking_Primary, borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(Banking_ic_Transfer, color: Banking_TextColorWhite),
                                    10.width,
                                    Text('Transfer', style: primaryTextStyle(size: 16, color: Banking_TextColorWhite)),
                                  ],
                                ),
                              ).expand(),
                            ],
                          ).paddingAll(16)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            color: Banking_app_Background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recently Transaction", style: primaryTextStyle(size: 16, color: Banking_TextColorPrimary, fontFamily: fontRegular)),
                    Text("22 Feb 2020", style: primaryTextStyle(size: 16, color: Banking_TextColorSecondary, fontFamily: fontRegular)),
                  ],
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList1.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      decoration: boxDecorationRoundedWithShadow(8, backgroundColor: Banking_whitePureColor, spreadRadius: 0, blurRadius: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.account_balance_wallet, size: 30, color: mList1[index].color),
                          10.width,
                          Text('${mList1[index].title}', style: primaryTextStyle(size: 16, color: mList1[index].color, fontFamily: fontMedium)).expand(),
                          Text(mList1[index].bal!, style: primaryTextStyle(color: mList1[index].color, size: 16)),
                        ],
                      ),
                    );
                  },
                ),
                16.height,
                Text("22 Feb 2020", style: primaryTextStyle(size: 16, color: Banking_TextColorSecondary, fontFamily: fontRegular)),
                Divider(),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 15,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    BankingHomeModel2 data = mList2[index % mList2.length];
                    return Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      decoration: boxDecorationRoundedWithShadow(8, backgroundColor: Banking_whitePureColor, spreadRadius: 0, blurRadius: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(data.icon!, height: 30, width: 30, color: index == 2 ? Banking_Primary : Banking_Primary),
                          10.width,
                          Text(data.title!, style: primaryTextStyle(size: 16, color: Banking_TextColorPrimary, fontFamily: fontRegular)).expand(),
                          Align(alignment: Alignment.centerRight, child: Text(data.charge!, style: primaryTextStyle(color: data.color, size: 16)))
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
