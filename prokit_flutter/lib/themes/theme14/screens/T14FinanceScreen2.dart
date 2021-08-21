import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

class T14FinanceScreen2 extends StatefulWidget {
  @override
  _T14FinanceScreen2State createState() => _T14FinanceScreen2State();
}

class _T14FinanceScreen2State extends State<T14FinanceScreen2> {
  List<MessageListModel> transactionList = getTransactionList();
  List<MessageListModel> atmCardList = getAtmCardList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: t14_txt_Finance2bgColor,
        appBar: AppBar(
          backgroundColor: t14_txt_Finance2bgColor,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, size: 18),
              onPressed: () {
                finish(context);
              }),
          title: Text(t14_txt_VisaCard.validate(), style: boldTextStyle(size: 16)),
          centerTitle: true,
          actions: [
            IconButton(icon: Icon(Icons.search, size: 20), onPressed: () {}),
            IconButton(icon: Icon(Icons.star_border, size: 20), onPressed: () {}),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 160,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        16.width,
                        Container(
                          height: 160,
                          width: 50,
                          decoration: boxDecorationWithRoundedCorners(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            backgroundColor: t14_call_BgColor.withOpacity(0.5),
                          ),
                          child: Icon(Icons.add, size: 22, color: t14_colorBlue),
                        ),
                        ListView.builder(
                            itemCount: atmCardList.length,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              MessageListModel data = atmCardList[index];
                              return Stack(
                                children: [
                                  Container(
                                    width: context.width() * 0.7,
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    decoration: boxDecorationWithRoundedCorners(
                                      borderRadius: BorderRadius.all(Radius.circular(16)),
                                      backgroundColor: t14_colorLightCrem1,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(data.img!, width: 200, height: 80, color: white),
                                        Row(
                                          children: [
                                            Icon(Entypo.dot_single, color: white, size: 20),
                                            Icon(Entypo.dot_single, color: white, size: 20),
                                            Icon(Entypo.dot_single, color: white, size: 20),
                                            Icon(Entypo.dot_single, color: white, size: 20),
                                            8.width,
                                            Text(data.name!, style: boldTextStyle(size: 20, color: white))
                                          ],
                                        ).paddingOnly(left: 30),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -15,
                                    left: 110,
                                    child: Icon(Entypo.dot_single, color: data.isActive! ? t14_OppsColor1 : Colors.transparent, size: 50),
                                  ),
                                ],
                              );
                            }).expand(),
                      ],
                    ),
                  ),
/*
                      Container(
                    height: 160,
                    child: ListView.builder(
                        itemCount: atmCardList.length,
                        padding: EdgeInsets.all(8),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          MessageListModel data = atmCardList[index];
                          return Row(
                            children: [
                              Container(
                                height: 150,
                                width: 50,
                                decoration: boxDecorationWithRoundedCorners(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  backgroundColor: t14_call_BgColor.withOpacity(0.5),
                                ),
                                child: Icon(Icons.add, size: 22, color: t14_colorBlue),
                              ).visible(index == 0),
                              16.width,
                              Stack(
                                overflow: Overflow.visible,
                                children: [
                                  Container(
                                    width: context.width() * 0.8,
                                    height: 160,
                                    decoration: boxDecorationWithRoundedCorners(
                                      borderRadius: BorderRadius.all(Radius.circular(16)),
                                      backgroundColor: t14_colorLightCrem1,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(data.img, width: 200, height: 80, color: white),
                                        Row(
                                          children: [
                                            Icon(Entypo.dot_single, color: white, size: 20),
                                            Icon(Entypo.dot_single, color: white, size: 20),
                                            Icon(Entypo.dot_single, color: white, size: 20),
                                            Icon(Entypo.dot_single, color: white, size: 20),
                                            8.width,
                                            Text(data.name, style: boldTextStyle(size: 20, color: white))
                                          ],
                                        ).paddingOnly(left: 30),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -22,
                                    left: 110,
                                    child: Icon(Entypo.dot_single, color: data.isActive ? t14_OppsColor1 : Colors.transparent, size: 50),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                  ),*/
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: context.height(),
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.all(Radius.circular(20)), backgroundColor: white),
                    child: Column(
                      children: [
                        Row(children: [
                          Text(t14_txt_transaction, textAlign: TextAlign.center, style: boldTextStyle(size: 16, color: t14_colorBlue)).expand(),
                          IconButton(icon: Icon(Entypo.dots_three_horizontal, size: 18), onPressed: () {})
                        ]),
                        ListView.builder(
                            itemCount: transactionList.length,
                            padding: EdgeInsets.all(8),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              MessageListModel data = transactionList[index];
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                                child: Row(
                                  children: [
                                    Text(data.img!, style: boldTextStyle(size: 14, color: t14_SuccessTxtColor.withOpacity(0.5))),
                                    16.width,
                                    Text(data.name!, style: boldTextStyle(size: 14, color: t14_colorBlue)).expand(),
                                    Text(data.message!, style: boldTextStyle(size: 14, color: data.isActive! ? t14_txt_trasactionColor : t14_OppsColor2)),
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
