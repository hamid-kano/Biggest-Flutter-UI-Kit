import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/grocery_addPayment_model.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryAddCard.dart';

class GroceryAddPaymentScreen extends StatefulWidget {
  static String tag = '/GroceryAddPaymentScreen';

  @override
  _GroceryAddPaymentScreenState createState() => _GroceryAddPaymentScreenState();
}

class _GroceryAddPaymentScreenState extends State<GroceryAddPaymentScreen> {
  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  List<AddPayment> listAddPayment = addPayment;
  String? cardNumber = '';

  @override
  Widget build(BuildContext context) {
    final trackOrder = ListView.builder(
        itemCount: listAddPayment.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            decoration: boxDecoration(showShadow: true, radius: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: text(
                        listAddPayment[index].cardName,
                        fontSize: textSizeNormal,
                        fontFamily: fontMedium,
                      ).paddingOnly(bottom: 8),
                    ),
                    Icon(
                      Icons.delete_outline,
                      color: grocery_textColorSecondary,
                    ).onTap(() {
                      cardNumber = listAddPayment[index].cardNumber;
                      removeCardBottomSheet(context);
                    })
                  ],
                ),
                text(
                  listAddPayment[index].cardNumber,
                  fontSize: textSizeNormal,
                  fontFamily: fontMedium,
                  textColor: textSecondaryColor,
                ).paddingOnly(bottom: 16),
                Row(
                  children: <Widget>[
                    text(grocery_month + " / ", fontSize: textSizeMedium, fontFamily: fontMedium, textColor: grocery_textColorSecondary),
                    text(grocery_year, fontSize: textSizeMedium, fontFamily: fontMedium, textColor: grocery_textColorSecondary),
                  ],
                ),
                Row(
                  children: <Widget>[
                    text(
                      listAddPayment[index].expMonth + " / ",
                      fontSize: textSizeMedium,
                      fontFamily: fontMedium,
                    ),
                    text(
                      listAddPayment[index].expYear,
                      fontSize: textSizeMedium,
                      fontFamily: fontMedium,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: text(
                        listAddPayment[index].bankName,
                        fontSize: textSizeMedium,
                        fontFamily: fontMedium,
                        textColor: textSecondaryColor,
                      ).paddingOnly(top: 16),
                    ),
                    Image.asset(
                      listAddPayment[index].cardType == 'visa' ? grocery_ic_visa : grocery_ic_masterCard,
                      height: 40,
                      width: 50,
                    ),
                  ],
                ),
              ],
            ).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
          ).paddingOnly(left: 16, right: 16, top: 16).onTap(() {
            GroceryAddCardScreen().launch(context);
          });
        });
    changeStatusColor(grocery_colorPrimary);
    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: AppBar(
        backgroundColor: grocery_colorPrimary,
        leading: Icon(
          Icons.arrow_back,
          size: 30,
          color: grocery_color_white,
        ).onTap(() {
          finish(context);
        }),
        title: text(grocery_paymentMethod, fontSize: textSizeNormal, textColor: grocery_color_white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            trackOrder,
            Container(
              margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
              decoration: boxDecoration(showShadow: true, radius: 10.0),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add,
                    size: 30,
                    color: grocery_textColorSecondary,
                  ),
                  text(grocery_addCard)
                ],
              ),
            ).onTap(() {
              GroceryAddCardScreen().launch(context);
            }),
          ],
        ),
      ),
    );
  }

  removeCardBottomSheet(context) async {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: IntrinsicHeight(
                child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(spacing_large), topRight: Radius.circular(spacing_large)), color: grocery_color_white),
              height: MediaQuery.of(context).size.height / 2.8,
              padding: EdgeInsets.all(spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: spacing_standard_new, top: spacing_middle),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: grocery_color_red),
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                        child: Icon(
                          Icons.delete,
                          color: grocery_color_white,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            text(grocery_lbl_remove_an_item, fontFamily: fontMedium, fontSize: textSizeNormal),
                            Text(
                              grocery_removeMsg + ' ' + cardNumber! + ' ' + grocery_card + '?',
                              style: TextStyle(fontSize: textSizeMedium, fontFamily: fontMedium, color: grocery_textColorSecondary),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: spacing_large,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      text("$grocery_lbl_no", textColor: grocery_textColorSecondary, textAllCaps: true, fontFamily: fontMedium),
                      SizedBox(
                        width: spacing_standard_new,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: groceryButton(
                            textContent: grocery_lbl_remove,
                            onPressed: (() {}),
                            bgColors: grocery_color_red,
                          ))
                    ],
                  )
                ],
              ),
            )),
          );
        });
  }
}
