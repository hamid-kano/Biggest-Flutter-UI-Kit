import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GrocerySaveCart.dart';

class GroceryAddSaveCartName extends StatefulWidget {
  static String tag = '/GrocerySaveCart';

  @override
  GroceryAddSaveCartNameState createState() => GroceryAddSaveCartNameState();
}

class GroceryAddSaveCartNameState extends State<GroceryAddSaveCartName> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(grocery_color_white);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: grocery_app_background,
      body: SafeArea(
        child: Container(
          width: width,
          decoration: BoxDecoration(
              color: grocery_color_white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: const Radius.circular(20.0),
              ),
              boxShadow: <BoxShadow>[BoxShadow(color: grocery_ShadowColor, blurRadius: 20.0, offset: Offset(0.0, 0.9))]),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        finish(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: grocery_icon_color,
                      ),
                    ),
                    SizedBox(
                      width: spacing_standard_new,
                    ),
                    text(grocery_lbl_save_cart, fontFamily: fontBold, fontSize: textSizeLargeMedium)
                  ],
                ),
                SizedBox(
                  height: spacing_standard_new,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        right: spacing_standard_new,
                        top: spacing_middle,
                        left: spacing_standard_new,
                      ),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: grocery_colorPrimary),
                      padding: EdgeInsets.all(width * 0.02),
                      child: Icon(
                        Icons.shopping_cart,
                        color: grocery_color_white,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(grocery_lbl_save_shopping_cart, fontFamily: fontMedium, fontSize: textSizeNormal),
                          text(
                            grocery_msg_save_shopping_cart,
                            textColor: grocery_textColorSecondary,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: spacing_standard_new,
                ),
                EditText(text: grocery_hint_enter_cart_name, fontSize: textSizeLargeMedium, isPassword: false, keyboardType: TextInputType.text).paddingAll(spacing_standard_new),
                Align(
                  alignment: Alignment.topRight,
                  child: FittedBox(
                    child: Container(
                      margin: EdgeInsets.only(bottom: spacing_standard_new, right: spacing_standard_new),
                      child: groceryButton(
                        textContent: grocery_lbl_Next,
                        onPressed: (() {
                          GrocerySaveCart().launch(context);
                        }),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
