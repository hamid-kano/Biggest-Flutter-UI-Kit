import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusDataGenerator.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';

import 'QIBusAddCard.dart';
import 'QIBusCards.dart';

class QIBusPayment extends StatefulWidget {
  static String tag = '/QIBusPayment';

  @override
  QIBusPaymentState createState() => QIBusPaymentState();
}

class QIBusPaymentState extends State<QIBusPayment> {
  late List<QIBusCardModel> mCardsList;

  @override
  void initState() {
    super.initState();
    mCardsList = QIBusGetPayment();
  }

  Widget mCards() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: mCardsList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Cards(mCardsList[index], index);
        });
  }

  Widget mOption(var icon, var lbl, {required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
        decoration: boxDecoration(radius: spacing_middle, bgColor: qIBus_white, showShadow: true),
        padding: EdgeInsets.fromLTRB(spacing_standard_new, spacing_standard_new, spacing_standard_new, spacing_standard_new),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RichText(
                text: TextSpan(
              children: [
                WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.only(right: spacing_standard),
                    child: SvgPicture.asset(
                      icon,
                      color: qIBus_textHeader,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
                TextSpan(text: lbl, style: TextStyle(fontFamily: fontMedium, fontSize: textSizeMedium, color: qIBus_textHeader)),
              ],
            )),
            Icon(
              Icons.keyboard_arrow_right,
              color: qIBus_icon_color,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: qIBus_app_background,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(color: qIBus_colorPrimary, height: 70),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.width * 0.15,
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.arrow_back, color: qIBus_white),
                                  onPressed: () {
                                    finish(context);
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(spacing_standard, 0, 0, 0),
                                  child: text(QIBus_text_payment, textColor: qIBus_white, fontSize: textSizeNormal, fontFamily: fontBold),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                QIBusAddCard().launch(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: spacing_standard_new),
                                child: Icon(Icons.add_circle_outline, color: qIBus_white, size: 24),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
                        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: qIBus_app_background),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      mCards(),
                      mOption(qibus_ic_banking, QIBus_text_net_banking, onTap: () {}),
                      mOption(qibus_ic_cards, QIBus_text_credit_card, onTap: () {
                        QIBusAddCard().launch(context);
                      }),
                      mOption(qibus_ic_cards, QIBus_text_debit, onTap: () {
                        QIBusAddCard().launch(context);
                      }),
                      mOption(qibus_ic_wallet, QIBus_text_Mobilewallet, onTap: () {}),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
