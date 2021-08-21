import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryChangePassword extends StatefulWidget {
  static String tag = '/GroceryChangePassword';

  @override
  _GroceryChangePasswordState createState() => _GroceryChangePasswordState();
}

class _GroceryChangePasswordState extends State<GroceryChangePassword> {
  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_color_white);
    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: title1(grocery_lbl_Change_Password, grocery_color_white, grocery_textColorPrimary, context),
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
              EditText(
                text: grocery_lbl_old_Password,
              ).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              EditText(
                text: grocery_lbl_new_Password,
              ).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              EditText(
                text: grocery_lbl_confirm_Password,
              ).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              SizedBox(
                height: spacing_standard_new,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FittedBox(
                  child: groceryButton(
                    textContent: grocery_lbl_Save,
                    color: grocery_colorPrimary,
                    onPressed: (() {}),
                  ).paddingOnly(right: spacing_standard_new, bottom: spacing_standard_new).paddingOnly(top: spacing_standard_new, bottom: spacing_standard_new),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
