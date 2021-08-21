import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryPaymentMethods extends StatefulWidget {
  static String tag = '/GroceryPaymentMethods';

  @override
  _GroceryPaymentMethodsState createState() => _GroceryPaymentMethodsState();
}

class _GroceryPaymentMethodsState extends State<GroceryPaymentMethods> {
  late List<GroceryPaymentModel> mList1;

  @override
  // ignore: must_call_super
  void initState() {
    mList1 = groceryPaymentMethodList();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_color_white);
    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: title1(grocery_lbl_payment_method, grocery_color_white, grocery_textColorPrimary, context),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          decoration: BoxDecoration(
              color: grocery_color_white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: const Radius.circular(20.0),
              ),
              boxShadow: <BoxShadow>[BoxShadow(color: grocery_ShadowColor, blurRadius: 20.0, offset: Offset(0.0, 0.9))]),
          child: Column(
            children: <Widget>[
              ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 60,
                              width: 60,
                              decoration: boxDecoration(radius: 35.0, bgColor: mList1[index].color),
                              child: Image.asset(
                                mList1[index].cardImg,
                                height: 30,
                                width: 30,
                              ).paddingAll(spacing_standard),
                            ).paddingOnly(top: spacing_control, left: spacing_large, bottom: spacing_control, right: spacing_standard),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      text(mList1[index].name, textColor: grocery_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium)
                                          .paddingOnly(left: spacing_standard, right: spacing_standard),
                                      text(mList1[index].cardNumber, textColor: grocery_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium)
                                          .paddingOnly(left: spacing_standard, right: spacing_standard)
                                    ],
                                  ).paddingOnly(top: spacing_standard),
                                  Icon(
                                    mList1[index].isSelected == true ? Icons.check_circle : Icons.radio_button_unchecked,
                                    color: mList1[index].isSelected == true ? grocery_colorPrimary : Colors.grey,
                                    size: 30,
                                  ).paddingOnly(top: spacing_standard_new, right: spacing_standard_new),
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider()
                      ],
                    ).paddingOnly(top: spacing_standard, bottom: spacing_standard);
                  }),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: boxDecoration(radius: 35.0, bgColor: grocery_colorPrimary.withOpacity(0.2)),
                    child: Icon(
                      Icons.credit_card,
                      size: 30,
                      color: grocery_colorPrimary,
                    ).paddingAll(spacing_standard),
                  ).paddingOnly(top: spacing_control, left: spacing_large, bottom: spacing_control, right: spacing_standard),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text('Add a Payment Method', textColor: grocery_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium)
                                  .paddingOnly(left: spacing_standard, right: spacing_standard),
                              text('Add Credit card or debit card', textColor: grocery_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium)
                                  .paddingOnly(left: spacing_standard, right: spacing_standard)
                            ],
                          ).paddingOnly(top: spacing_standard),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                          size: 30,
                        ).paddingOnly(top: spacing_standard_new, right: spacing_standard_new),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: spacing_large,
              )
            ],
          ),
        ),
      ),
    );
  }
}
