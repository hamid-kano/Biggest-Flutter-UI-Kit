import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/shopHop/models/ShPaymentCard.dart';
import 'package:prokit_flutter/fullApps/shopHop/screens/ShAddCardScreen.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShImages.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShWidget.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/widgets/ShSliderWidget.dart';

class ShPaymentsScreen extends StatefulWidget {
  static String tag = '/ShPaymentsScreen';

  @override
  ShPaymentsScreenState createState() => ShPaymentsScreenState();
}

class ShPaymentsScreenState extends State<ShPaymentsScreen> {
  List<ShPaymentCard> mPaymentCards = [];

  @override
  void initState() {
    super.initState();
    mPaymentCards.add(ShPaymentCard());
    mPaymentCards.add(ShPaymentCard());
    mPaymentCards.add(ShPaymentCard());
    mPaymentCards.add(ShPaymentCard());
    mPaymentCards.add(ShPaymentCard());
    mPaymentCards.add(ShPaymentCard());
  }

  @override
  Widget build(BuildContext context) {
    var paymentDetail = Container(
      margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
      decoration: BoxDecoration(border: Border.all(color: sh_view_color, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(spacing_standard_new, spacing_middle, spacing_standard_new, spacing_middle),
            child: text(sh_lbl_payment_details, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
          ),
          Divider(
            height: 1,
            color: sh_view_color,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(spacing_standard_new, spacing_middle, spacing_standard_new, spacing_middle),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    text(sh_lbl_offer),
                    text(sh_text_offer_not_available, textColor: sh_textColorPrimary, fontFamily: fontMedium),
                  ],
                ),
                SizedBox(
                  height: spacing_standard,
                ),
                Row(
                  children: <Widget>[
                    text(sh_lbl_shipping_charge),
                    text(sh_lbl_free, textColor: Colors.green, fontFamily: fontMedium),
                  ],
                ),
                SizedBox(
                  height: spacing_standard,
                ),
                Row(
                  children: <Widget>[
                    text(sh_lbl_total_amount),
                    text("\$70", textColor: sh_colorPrimary, fontFamily: fontBold, fontSize: textSizeLargeMedium),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_white,
        title: text(sh_title_payment, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontBold),
        iconTheme: IconThemeData(color: sh_textColorPrimary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(spacing_standard_new),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  text(sh_lbl_quick_pay, textColor: sh_textColorPrimary, fontFamily: fontBold, fontSize: textSizeLargeMedium),
                  MaterialButton(
                    textColor: sh_colorPrimary,
                    padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: 0, bottom: 0),
                    child: text(sh_lbl_add_card, fontSize: textSizeSMedium, textColor: sh_colorPrimary),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(spacing_large),
                      side: BorderSide(color: sh_colorPrimary),
                    ),
                    onPressed: () {
                      ShAddCardScreen().launch(context);
                    },
                  )
                ],
              ),
            ),
            ShPaymentCards(mPaymentCards),
            Padding(
              padding: const EdgeInsets.all(spacing_standard_new),
              child: Column(
                children: <Widget>[
                  divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            color: sh_textColorPrimary,
                          ),
                          SizedBox(
                            width: spacing_standard_new,
                          ),
                          text(sh_lbl_pay_with_debit_credit_card, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                        ],
                      ),
                    ),
                  ),
                  divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            color: sh_textColorPrimary,
                          ),
                          SizedBox(
                            width: spacing_standard_new,
                          ),
                          text(sh_lbl_cash_on_delivery, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                        ],
                      ),
                    ),
                  ),
                  divider(),
                  paymentDetail
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ShPaymentCards extends StatelessWidget {
  List<ShPaymentCard> mSliderList;

  ShPaymentCards(this.mSliderList);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    return ShCarouselSlider(
      viewportFraction: 0.9,
      height: 210,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mSliderList.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 210,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    card,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: 210,
                  ),
                  Padding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text("Debit card", textColor: sh_white, fontSize: textSizeLargeMedium, fontFamily: fontBold),
                              text("MVK Bank", textColor: sh_white, fontSize: textSizeLargeMedium, fontFamily: fontBold)
                            ],
                          ),
                          SizedBox(
                            height: spacing_middle,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  chip,
                                  width: 50,
                                  height: 30,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height: spacing_standard_new,
                                ),
                                text("3434 3434 3434", textColor: sh_white, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                                text("valid 12/12", textColor: sh_white, fontSize: textSizeSMedium),
                                SizedBox(
                                  height: spacing_standard,
                                ),
                                Expanded(child: text("JOHN", textColor: sh_white, fontFamily: fontMedium, fontSize: textSizeMedium)),
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(14)),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
