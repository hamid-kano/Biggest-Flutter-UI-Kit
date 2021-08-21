import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryAddCardScreen extends StatefulWidget {
  static String tag = '/GroceryAddCardScreen';

  @override
  _GroceryAddCardScreenState createState() => _GroceryAddCardScreenState();
}

class _GroceryAddCardScreenState extends State<GroceryAddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grocery_color_white,
        leading: Icon(
          Icons.clear,
          color: grocery_textColorSecondary,
        ).onTap(() {
          finish(context);
        }),
        title: text(grocery_paymentMethod, fontSize: textSizeNormal, textColor: grocery_textColorPrimary, fontFamily: fontBold),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: boxDecorationDefault(color: whiteColor),
          child: Column(
            children: <Widget>[
              EditText(
                text: grocery_cardHolderName,
                isPassword: false,
                keyboardType: TextInputType.text,
              ).paddingOnly(left: 0, right: spacing_standard_new),
              EditText(
                text: grocery_cardNumber,
                isPassword: false,
                keyboardType: TextInputType.number,
              ).paddingOnly(left: 0, right: spacing_standard_new, top: spacing_standard),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: EditText(
                        text: grocery_month,
                        isPassword: false,
                        keyboardType: TextInputType.text,
                      ).paddingOnly(right: 16)),
                  Expanded(
                      flex: 1,
                      child: EditText(
                        text: grocery_year,
                        isPassword: false,
                        keyboardType: TextInputType.number,
                      ).paddingOnly(right: 16)),
                  Expanded(
                      flex: 1,
                      child: EditText(
                        text: grocery_cvv,
                        isPassword: false,
                        keyboardType: TextInputType.number,
                      )),
                ],
              ).paddingOnly(top: spacing_standard, left: 0),
              Align(
                alignment: Alignment.topRight,
                child: FittedBox(
                  child: groceryButton(
                    textContent: grocery_save,
                    onPressed: (() {}),
                  ),
                ),
              ).paddingOnly(top: 16, bottom: 16),
            ],
          ).paddingOnly(left: 16, right: 16),
        ).cornerRadiusWithClipRRect(15).paddingOnly(bottom: 16),
      ),
    );
  }
}
