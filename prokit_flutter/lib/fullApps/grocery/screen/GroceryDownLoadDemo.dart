import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryDownLoadDemo extends StatefulWidget {
  static String tag = '/GroceryDownLoadDemo';

  @override
  _GroceryDownLoadDemoState createState() => _GroceryDownLoadDemoState();
}

class _GroceryDownLoadDemoState extends State<GroceryDownLoadDemo> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_color_white);

    return Scaffold(
      backgroundColor: grocery_color_white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: spacing_xxLarge,
            ),
            SizedBox(
              height: spacing_xxLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  Grocery_ic_Android,
                  height: width * 0.2,
                  width: width * 0.2,
                  fit: BoxFit.fill,
                ).paddingAll(spacing_standard),
                text("Android", textColor: grocery_textGreenColor, fontSize: textSizeLarge, fontFamily: fontSemiBold)
              ],
            ),
            text("Grocery Shopping App", textColor: grocery_textColorPrimary, fontSize: textSizeLarge, fontFamily: fontSemiBold, isCentered: true).paddingOnly(bottom: spacing_standard),
            text("Design by Ishan Maduskha", textColor: grocery_textColorSecondary, fontSize: textSizeLargeMedium, fontFamily: fontSemiBold, isCentered: true),
            SizedBox(
              height: spacing_xxLarge,
            ),
            SizedBox(
              height: spacing_xxLarge,
            ),
            groceryButton(textContent: grocery_lbl_View_Behance_Project, bgColors: grocery_DarkBlue_Color, onPressed: () {}).paddingAll(spacing_xxLarge),
            groceryButton(textContent: grocery_lbl_Download_Demo, bgColors: grocery_blue_Color, onPressed: () {}).paddingOnly(left: spacing_xxLarge, right: spacing_xxLarge),
            groceryButton(textContent: grocery_lbl_View_Dribble_Shot, bgColors: grocery_Pink_Color, onPressed: () {}).paddingOnly(top: spacing_xxLarge, left: spacing_xxLarge, right: spacing_xxLarge),
            SizedBox(
              height: spacing_xxLarge,
            ),
            SizedBox(
              height: spacing_xxLarge,
            ),
            groceryButton(textContent: grocery_lbl_Open_App_Prototype, bgColors: grocery_colorPrimary, onPressed: () {})
                .paddingOnly(top: spacing_xxLarge, left: spacing_xxLarge, right: spacing_xxLarge),
            SizedBox(
              height: spacing_xxLarge,
            ),
          ],
        ),
      ),
    );
  }
}
