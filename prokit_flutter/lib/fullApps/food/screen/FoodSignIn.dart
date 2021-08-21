import 'package:cached_network_image/cached_network_image.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodColors.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodImages.dart';
import 'package:prokit_flutter/fullApps/food/utils/FoodString.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'FoodCreateAccount.dart';

class FoodSignIn extends StatefulWidget {
  static String tag = '/FoodSignIn';

  @override
  FoodSignInState createState() => FoodSignInState();
}

class FoodSignInState extends State<FoodSignIn> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);

    var width = MediaQuery.of(context).size.width;
    Widget mOption(var color, var icon, var value, var iconColor, valueColor) {
      return InkWell(
        onTap: () {
          FoodCreateAccount().launch(context);
        },
        child: Container(
          width: width,
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: SvgPicture.asset(icon, color: iconColor, width: 18, height: 18),
                  ),
                ),
                TextSpan(text: value, style: primaryTextStyle(size: 16, color: valueColor)),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CachedNetworkImage(
            placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
            imageUrl: food_ic_login,
            height: width * 0.6,
            fit: BoxFit.cover,
            width: width,
          ),
          Container(
            margin: EdgeInsets.only(top: width * 0.5),
            child: Stack(
              children: <Widget>[
                Arc(
                  arcType: ArcType.CONVEX,
                  edge: Edge.TOP,
                  height: (MediaQuery.of(context).size.width) / 10,
                  child: Container(height: (MediaQuery.of(context).size.height), width: MediaQuery.of(context).size.width, color: food_color_green),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: food_white),
                    width: width * 0.13,
                    height: width * 0.13,
                    child: Icon(Icons.arrow_forward, color: food_textColorPrimary),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: width * 0.1),
                      Text(food_app_name, style: boldTextStyle(color: food_white, size: 30)),
                      SizedBox(height: width * 0.12),
                      mOption(food_white, food_ic_google_fill, food_lbl_google, food_color_red, food_textColorPrimary),
                      mOption(food_colorPrimary, food_ic_fb, food_lbl_facebook, food_white, food_white),
                      SizedBox(height: width * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(height: 0.5, color: food_white, width: width * 0.07, margin: EdgeInsets.only(right: 4)),
                          Text(food_lbl_or_use_your_mobile_email.toUpperCase(), style: primaryTextStyle(color: food_white, size: 14)),
                          Container(height: 0.5, color: food_white, width: width * 0.07, margin: EdgeInsets.only(left: 4)),
                        ],
                      ),
                      SizedBox(height: width * 0.07),
                      GestureDetector(
                        onTap: () {
                          FoodCreateAccount().launch(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(color: food_color_green, border: Border.all(color: white), borderRadius: BorderRadius.circular(50)),
                          width: width,
                          padding: EdgeInsets.all(10),
                          child: Text(food_lbl_continue_with_email_mobile, style: primaryTextStyle(color: food_white)).center(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
